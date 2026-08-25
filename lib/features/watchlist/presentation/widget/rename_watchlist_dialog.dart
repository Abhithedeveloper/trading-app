import 'package:flutter/material.dart';

class RenameWatchlistDialog extends StatefulWidget {
  const RenameWatchlistDialog({
    super.key,
    required this.initialName,
    required this.onRename,
  });

  final String initialName;
  final ValueChanged<String> onRename;

  @override
  State<RenameWatchlistDialog> createState() =>
      _RenameWatchlistDialogState();
}

class _RenameWatchlistDialogState
    extends State<RenameWatchlistDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(
      text: widget.initialName,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _rename() {
    final name = _controller.text.trim();

    if (name.isEmpty) {
      return;
    }

    widget.onRename(name);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Rename Watchlist'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: const InputDecoration(
          labelText: 'Name',
        ),
        onSubmitted: (_) {
          _rename();
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
          onPressed: _rename,
          child: const Text('Rename'),
        ),
      ],
    );
  }
}