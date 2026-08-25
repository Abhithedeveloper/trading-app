import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trading_app/core/constants/app_strings.dart';

import '../../../market_data/domain/entity/market_data_entity.dart';
import '../../../market_data/presentation/bloc/market_data_bloc.dart'
    as market;
import '../../../market_data/presentation/extensions/market_data_entity_extension.dart';

import '../../domain/entity/watchlist_entity.dart';

// ============================================================================
// WATCHLIST CARD
// ============================================================================

class WatchlistCard extends StatelessWidget {
  const WatchlistCard({
    super.key,
    required this.watchlist,
    required this.onRename,
    required this.onDelete,
    required this.onAddStock,
    required this.onRemoveStock,
    required this.onReorderStock,
    required this.onStockTap,
  });

  // ==========================================================================
  // DATA
  // ==========================================================================

  final WatchlistEntity watchlist;

  // ==========================================================================
  // CALLBACKS
  // ==========================================================================

  final VoidCallback onRename;

  final VoidCallback onDelete;

  final VoidCallback onAddStock;

  final ValueChanged<String> onRemoveStock;

  final void Function(
    int oldIndex,
    int newIndex,
  ) onReorderStock;

  final ValueChanged<String> onStockTap;

  // ==========================================================================
  // BUILD
  // ==========================================================================

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: ExpansionTile(
        title: Text(
          watchlist.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '${watchlist.symbols.length} stocks',
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (
            value,
          ) {
            switch (value) {
              case 'rename':
                onRename();

              case 'delete':
                onDelete();
            }
          },
          itemBuilder: (
            context,
          ) {
            return const [
              PopupMenuItem(
                value: 'rename',
                child: Text(
                  AppStrings.rename,
                ),
              ),
              PopupMenuItem(
                value: 'delete',
                child: Text(
                  AppStrings.delete,
                ),
              ),
            ];
          },
        ),
        children: [
          // ==================================================================
          // EMPTY WATCHLIST
          // ==================================================================

          if (watchlist.symbols.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                AppStrings.noStocksAdded,
              ),
            )

          // ==================================================================
          // STOCKS
          // ==================================================================

          else
            SizedBox(
              height: watchlist.symbols.length * 72.0,
              child: ReorderableListView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),
                itemCount: watchlist.symbols.length,

                // ----------------------------------------------------------------
                // REORDER
                // ----------------------------------------------------------------

                onReorder: (
                  oldIndex,
                  newIndex,
                ) {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }

                  if (oldIndex == newIndex) {
                    return;
                  }

                  onReorderStock(
                    oldIndex,
                    newIndex,
                  );
                },

                // ----------------------------------------------------------------
                // ITEM
                // ----------------------------------------------------------------

                itemBuilder: (
                  context,
                  index,
                ) {
                  final symbol =
                      watchlist.symbols[index];

                  return _WatchlistStockRow(
                    key: ValueKey(symbol),
                    symbol: symbol,
                    onStockTap: onStockTap,
                    onRemoveStock: onRemoveStock,
                  );
                },
              ),
            ),

          // ==================================================================
          // ADD STOCK
          // ==================================================================

          Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              8,
              16,
              16,
            ),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: onAddStock,
                icon: const Icon(
                  Icons.add,
                ),
                label: const Text(
                  AppStrings.addStock,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// STOCK ROW
// ============================================================================

class _WatchlistStockRow extends StatelessWidget {
  const _WatchlistStockRow({
    super.key,
    required this.symbol,
    required this.onStockTap,
    required this.onRemoveStock,
  });

  final String symbol;

  final ValueChanged<String> onStockTap;

  final ValueChanged<String> onRemoveStock;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
        market.MarketDataBloc,
        market.MarketDataState,
        MarketDataEntity?>(
      selector: (
        state,
      ) {
        return switch (state) {
          market.Loaded(
            :final marketData,
          ) =>
            marketData[symbol],

          _ => null,
        };
      },
      builder: (
        context,
        stock,
      ) {
        return ListTile(
          key: ValueKey(symbol),

          // ==================================================================
          // STOCK TAP
          // ==================================================================

          onTap: () {
            onStockTap(symbol);
          },

          leading: const Icon(
            Icons.drag_handle,
          ),

          // ==================================================================
          // SYMBOL
          // ==================================================================

          title: Text(
            symbol,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),

          // ==================================================================
          // CHANGE
          // ==================================================================

          subtitle: stock == null
              ? const Text(
                  AppStrings.marketDataUnavailable,
                )
              : Text(
                  '${stock.formattedChange} '
                  '(${stock.formattedChangePercent})',
                ),

          // ==================================================================
          // LTP + DELETE
          // ==================================================================

          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (stock != null)
                Text(
                  stock.formattedLtp,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              IconButton(
                onPressed: () {
                  onRemoveStock(symbol);
                },
                icon: const Icon(
                  Icons.delete_outline,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}