import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trading_app/features/watchlist/presentation/widget/create_watchlist_dialog.dart';
import 'package:trading_app/features/watchlist/presentation/widget/rename_watchlist_dialog.dart';
import 'package:trading_app/features/watchlist/presentation/widget/watchlist_card.dart';

import '../../../../core/di/injection.dart';
import '../../domain/entity/watchlist_entity.dart';
import '../bloc/watchlist_bloc.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<WatchlistBloc>()
        ..add(
          const WatchlistEvent.started(),
        ),
      child: const _WatchlistView(),
    );
  }
}

class _WatchlistView extends StatelessWidget {
  const _WatchlistView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlists'),
        actions: [
          IconButton(
            onPressed: () {
              _showCreateDialog(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<WatchlistBloc, WatchlistState>(
        builder: (context, state) {
          return switch (state) {
            Initial() => const Center(
                child: CircularProgressIndicator(),
              ),

            Loading() => const Center(
                child: CircularProgressIndicator(),
              ),

            Loaded(:final watchlists) => _WatchlistContent(
                watchlists: watchlists,
              ),

            Error(:final message) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          };
        },
      ),
    );
  }

  void _showCreateDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) {
        return CreateWatchlistDialog(
          onCreate: (name) {
            context.read<WatchlistBloc>().add(
                  WatchlistEvent.create(
                    name: name,
                  ),
                );
          },
        );
      },
    );
  }
}

class _WatchlistContent extends StatelessWidget {
  const _WatchlistContent({
    required this.watchlists,
  });

  final List<WatchlistEntity> watchlists;

  @override
  Widget build(BuildContext context) {
    if (watchlists.isEmpty) {
      return const Center(
        child: Text('No watchlists yet'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: watchlists.length,
      itemBuilder: (context, index) {
        final watchlist = watchlists[index];

        return WatchlistCard(
          key: ValueKey(watchlist.id),
          watchlist: watchlist,

          // Rename
          onRename: () {
            _showRenameDialog(
              context,
              watchlist,
            );
          },

          // Delete
          onDelete: () {
            _deleteWatchlist(
              context,
              watchlist,
            );
          },

          // Add stock
          onAddStock: () {
            _showAddStockDialog(
              context,
              watchlist.id,
            );
          },

          // Remove stock
          onRemoveStock: (symbol) {
            context.read<WatchlistBloc>().add(
                  WatchlistEvent.removeStock(
                    watchlistId: watchlist.id,
                    symbol: symbol,
                  ),
                );
          },

          // Reorder stocks inside this watchlist
          onReorderStock: (oldIndex, newIndex) {
            context.read<WatchlistBloc>().add(
                  WatchlistEvent.reorder(
                    watchlistId: watchlist.id,
                    oldIndex: oldIndex,
                    newIndex: newIndex,
                  ),
                );
          },
        );
      },
    );
  }

  void _showRenameDialog(
    BuildContext context,
    WatchlistEntity watchlist,
  ) {
    showDialog<void>(
      context: context,
      builder: (_) {
        return RenameWatchlistDialog(
          initialName: watchlist.name,
          onRename: (name) {
            context.read<WatchlistBloc>().add(
                  WatchlistEvent.rename(
                    id: watchlist.id,
                    name: name,
                  ),
                );
          },
        );
      },
    );
  }

  void _deleteWatchlist(
    BuildContext context,
    WatchlistEntity watchlist,
  ) {
    showDialog<void>(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Delete Watchlist'),
          content: Text(
            'Are you sure you want to delete "${watchlist.name}"?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<WatchlistBloc>().add(
                      WatchlistEvent.delete(
                        id: watchlist.id,
                      ),
                    );

                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _showAddStockDialog(
    BuildContext context,
    String watchlistId,
  ) {
    final controller = TextEditingController();

    showDialog<void>(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Add Stock'),
          content: TextField(
            controller: controller,
            autofocus: true,
            textCapitalization: TextCapitalization.characters,
            decoration: const InputDecoration(
              hintText: 'RELIANCE',
              labelText: 'Stock Symbol',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final symbol =
                    controller.text.trim().toUpperCase();

                if (symbol.isEmpty) {
                  return;
                }

                context.read<WatchlistBloc>().add(
                      WatchlistEvent.addStock(
                        watchlistId: watchlistId,
                        symbol: symbol,
                      ),
                    );

                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    ).then((_) {
      controller.dispose();
    });
  }
}