import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';

class DeleteWatchlistDialog extends StatelessWidget {
  const DeleteWatchlistDialog({
    super.key,
    required this.watchlistName,
    required this.onConfirm,
  });

  final String watchlistName;

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        AppStrings.deleteWatchlist,
      ),
      content: Text(
        'Are you sure you want to delete '
        '"$watchlistName"?',
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            AppStrings.cancel,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            onConfirm();

            Navigator.of(context).pop();
          },
          child: const Text(
            AppStrings.delete,
          ),
        ),
      ],
    );
  }
}