import 'package:flutter/material.dart';

import '../../domain/entity/watchlist_entity.dart';
import 'watchlist_card.dart';

// ============================================================================
// CALLBACK TYPES
// ============================================================================

typedef WatchlistCallback = void Function(
  WatchlistEntity watchlist,
);

typedef WatchlistStockCallback = void Function(
  String watchlistId,
  String symbol,
);

typedef WatchlistReorderCallback = void Function(
  String watchlistId,
  int oldIndex,
  int newIndex,
);

// ============================================================================
// WATCHLIST CONTENT
// ============================================================================

class WatchlistContent extends StatelessWidget {
  const WatchlistContent({
    super.key,
    required this.watchlists,
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

  final List<WatchlistEntity> watchlists;

  // ==========================================================================
  // CALLBACKS
  // ==========================================================================

  final WatchlistCallback onRename;

  final WatchlistCallback onDelete;

  final ValueChanged<String> onAddStock;

  final WatchlistStockCallback onRemoveStock;

  final WatchlistReorderCallback onReorderStock;

  final ValueChanged<String> onStockTap;

  // ==========================================================================
  // BUILD
  // ==========================================================================

  @override
  Widget build(BuildContext context) {
    if (watchlists.isEmpty) {
      return const Center(
        child: Text(
          'No watchlists found.',
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: watchlists.length,
      itemBuilder: (
        context,
        index,
      ) {
        final watchlist = watchlists[index];

        return WatchlistCard(
          key: ValueKey(
            watchlist.id,
          ),
          watchlist: watchlist,

          // ==================================================================
          // RENAME
          // ==================================================================

          onRename: () {
            onRename(watchlist);
          },

          // ==================================================================
          // DELETE
          // ==================================================================

          onDelete: () {
            onDelete(watchlist);
          },

          // ==================================================================
          // ADD STOCK
          // ==================================================================

          onAddStock: () {
            onAddStock(
              watchlist.id,
            );
          },

          // ==================================================================
          // REMOVE STOCK
          // ==================================================================

          onRemoveStock: (
            symbol,
          ) {
            onRemoveStock(
              watchlist.id,
              symbol,
            );
          },

          // ==================================================================
          // REORDER
          // ==================================================================

          onReorderStock: (
            oldIndex,
            newIndex,
          ) {
            onReorderStock(
              watchlist.id,
              oldIndex,
              newIndex,
            );
          },

          // ==================================================================
          // STOCK TAP
          // ==================================================================

          onStockTap: (
            symbol,
          ) {
            onStockTap(symbol);
          },
        );
      },
    );
  }
}