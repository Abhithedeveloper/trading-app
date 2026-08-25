import 'package:flutter/material.dart';

class CreateWatchlistDialog extends StatefulWidget {
  const CreateWatchlistDialog({
    super.key,
    required this.onCreate,
  });

  final ValueChanged<String> onCreate;

  @override
  State<CreateWatchlistDialog> createState() =>
      _CreateWatchlistDialogState();
}

class _CreateWatchlistDialogState
    extends State<CreateWatchlistDialog> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _create() {
    final name = _controller.text.trim();

    if (name.isEmpty) {
      return;
    }

    widget.onCreate(name);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create Watchlist'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: const InputDecoration(
          labelText: 'Name',
          hintText: 'My Watchlist',
        ),
        onSubmitted: (_) {
          _create();
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _create,
          child: const Text('Create'),
        ),
      ],
    );
  }
}