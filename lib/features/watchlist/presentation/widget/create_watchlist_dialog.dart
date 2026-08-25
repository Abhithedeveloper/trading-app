import 'package:flutter/material.dart';
import 'package:trading_app/core/constants/app_strings.dart';

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
      title:  Text(AppStrings.createWatchlist),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: const InputDecoration(
          labelText: AppStrings.name,
          hintText: AppStrings.myWatchlist,
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
          child:  Text(AppStrings.cancel),
        ),
        ElevatedButton(
          onPressed: _create,
          child:  Text(AppStrings.create),
        ),
      ],
    );
  }
}