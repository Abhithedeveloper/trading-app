import 'package:flutter/material.dart';

import '../../domain/entity/watchlist_entity.dart';

class WatchlistCard extends StatelessWidget {
  const WatchlistCard({
    super.key,
    required this.watchlist,
    required this.onRename,
    required this.onDelete,
    required this.onAddStock,
    required this.onRemoveStock,
    required this.onReorderStock,
  });

  final WatchlistEntity watchlist;
  final VoidCallback onRename;
  final VoidCallback onDelete;
  final VoidCallback onAddStock;
  final ValueChanged<String> onRemoveStock;
  final void Function(int oldIndex, int newIndex) onReorderStock;

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
          onSelected: (value) {
            switch (value) {
              case 'rename':
                onRename();
              case 'delete':
                onDelete();
            }
          },
          itemBuilder: (context) {
            return const [
              PopupMenuItem(
                value: 'rename',
                child: Text('Rename'),
              ),
              PopupMenuItem(
                value: 'delete',
                child: Text('Delete'),
              ),
            ];
          },
        ),
        children: [
          if (watchlist.symbols.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'No stocks added',
              ),
            )
          else
            SizedBox(
              height: watchlist.symbols.length * 56.0,
              child: ReorderableListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: watchlist.symbols.length,
                onReorder: onReorderStock,
                itemBuilder: (context, index) {
                  final symbol = watchlist.symbols[index];

                  return ListTile(
                    key: ValueKey(symbol),
                    leading: const Icon(
                      Icons.drag_handle,
                    ),
                    title: Text(symbol),
                    trailing: IconButton(
                      onPressed: () {
                        onRemoveStock(symbol);
                      },
                      icon: const Icon(
                        Icons.delete_outline,
                      ),
                    ),
                  );
                },
              ),
            ),
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
                icon: const Icon(Icons.add),
                label: const Text('Add Stock'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}