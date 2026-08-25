import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trading_app/core/constants/app_strings.dart';
import 'package:trading_app/core/widgets/app_dialog.dart';
import 'package:trading_app/features/trading/presentation/pages/trading_page.dart';

import '../../../../core/di/injection.dart';
import '../../../market_data/presentation/bloc/market_data_bloc.dart'
    as market;
import '../../domain/entity/watchlist_entity.dart';
import '../bloc/watchlist_bloc.dart';
import '../widget/watchlist_content.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WatchlistBloc>(
          create: (_) => getIt<WatchlistBloc>()
            ..add(
              const WatchlistEvent.started(),
            ),
        ),
        BlocProvider<market.MarketDataBloc>(
          create: (_) => getIt<market.MarketDataBloc>()
            ..add(
              const market.MarketDataEvent.started(),
            ),
        ),
      ],
      child: const _WatchlistView(),
    );
  }
}

// ============================================================================
// WATCHLIST VIEW
// ============================================================================

class _WatchlistView extends StatelessWidget {
  const _WatchlistView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlists'),
        actions: [
          IconButton(
            tooltip: 'Create watchlist',
            onPressed: () {
              _showCreateDialog(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<
          market.MarketDataBloc,
          market.MarketDataState>(
        builder: (
          context,
          marketState,
        ) {
          return switch (marketState) {
            market.Initial() => const Center(
                child: Text(
                  AppStrings.startingMarketData,
                ),
              ),

            market.Loading() => const Center(
                child: CircularProgressIndicator(),
              ),

            market.Error(
              :final message,
            ) =>
              _ErrorView(
                message: message,
              ),

            market.Loaded() => BlocBuilder<
                WatchlistBloc,
                WatchlistState>(
                builder: (
                  context,
                  watchlistState,
                ) {
                  return switch (watchlistState) {
                    Initial() => const Center(
                        child: CircularProgressIndicator(),
                      ),

                    Loading() => const Center(
                        child: CircularProgressIndicator(),
                      ),

                    Error(
                      :final message,
                    ) =>
                      _ErrorView(
                        message: message,
                      ),

                    Loaded(
                      :final watchlists,
                    ) =>
                      WatchlistContent(
                        watchlists: watchlists,
                        onRename: (
                          watchlist,
                        ) {
                          _showRenameDialog(
                            context,
                            watchlist,
                          );
                        },
                        onDelete: (
                          watchlist,
                        ) {
                          _deleteWatchlist(
                            context,
                            watchlist,
                          );
                        },
                        onAddStock: (
                          watchlistId,
                        ) {
                          _showAddStockDialog(
                            context,
                            watchlistId,
                          );
                        },
                        onRemoveStock: (
                          watchlistId,
                          symbol,
                        ) {
                          context
                              .read<WatchlistBloc>()
                              .add(
                                WatchlistEvent.removeStock(
                                  watchlistId: watchlistId,
                                  symbol: symbol,
                                ),
                              );
                        },
                        onReorderStock: (
                          watchlistId,
                          oldIndex,
                          newIndex,
                        ) {
                          context
                              .read<WatchlistBloc>()
                              .add(
                                WatchlistEvent.reorder(
                                  watchlistId: watchlistId,
                                  oldIndex: oldIndex,
                                  newIndex: newIndex,
                                ),
                              );
                        },
                        onStockTap: (
                          symbol,
                        ) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) {
                                return TradingPage(
                                  initialSymbol: symbol,
                                );
                              },
                            ),
                          );
                        },
                      ),
                  };
                },
              ),
          };
        },
      ),
    );
  }

  // ==========================================================================
  // CREATE
  // ==========================================================================

  Future<void> _showCreateDialog(
    BuildContext context,
  ) async {
    final name = await AppDialog.showTextInput(
      context: context,
      title: 'Create Watchlist',
      label: 'Watchlist name',
      hintText: 'Enter watchlist name',
      confirmText: 'Create',
    );

    if (name == null || name.trim().isEmpty) {
      return;
    }

    if (!context.mounted) {
      return;
    }

    context.read<WatchlistBloc>().add(
          WatchlistEvent.create(
            name: name.trim(),
          ),
        );
  }

  // ==========================================================================
  // RENAME
  // ==========================================================================

  Future<void> _showRenameDialog(
    BuildContext context,
    WatchlistEntity watchlist,
  ) async {
    final name = await AppDialog.showTextInput(
      context: context,
      title: 'Rename Watchlist',
      label: 'Watchlist name',
      initialValue: watchlist.name,
      confirmText: 'Rename',
    );

    if (name == null || name.trim().isEmpty) {
      return;
    }

    if (!context.mounted) {
      return;
    }

    context.read<WatchlistBloc>().add(
          WatchlistEvent.rename(
            id: watchlist.id,
            name: name.trim(),
          ),
        );
  }

  // ==========================================================================
  // DELETE
  // ==========================================================================

  Future<void> _deleteWatchlist(
    BuildContext context,
    WatchlistEntity watchlist,
  ) async {
    final confirmed = await AppDialog.showConfirmation(
      context: context,
      title: AppStrings.deleteWatchlist,
      message:
          'Are you sure you want to delete "${watchlist.name}"?',
      confirmText: AppStrings.delete,
      cancelText: AppStrings.cancel,
      isDestructive: true,
    );

    if (!confirmed) {
      return;
    }

    if (!context.mounted) {
      return;
    }

    context.read<WatchlistBloc>().add(
          WatchlistEvent.delete(
            id: watchlist.id,
          ),
        );
  }

  // ==========================================================================
  // ADD STOCK
  // ==========================================================================

  Future<void> _showAddStockDialog(
    BuildContext context,
    String watchlistId,
  ) async {
    const stocks = [
      'RELIANCE',
      'TCS',
      'INFY',
      'HDFCBANK',
      'ICICIBANK',
      'SBIN',
      'ITC',
      'LT',
      'BHARTIARTL',
      'AXISBANK',
    ];

    final symbol = await AppDialog.showSelection<String>(
      context: context,
      title: AppStrings.addStock,
      items: stocks,
      itemLabel: (
        stock,
      ) =>
          stock,
    );

    if (symbol == null) {
      return;
    }

    if (!context.mounted) {
      return;
    }

    context.read<WatchlistBloc>().add(
          WatchlistEvent.addStock(
            watchlistId: watchlistId,
            symbol: symbol,
          ),
        );
  }
}

// ============================================================================
// ERROR VIEW
// ============================================================================

class _ErrorView extends StatelessWidget {
  const _ErrorView({
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}