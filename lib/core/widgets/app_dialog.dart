import 'package:flutter/material.dart';

class AppDialog {
  AppDialog._();

  // ============================================================
  // TEXT INPUT DIALOG
  // ============================================================

  static Future<String?> showTextInput({
    required BuildContext context,
    required String title,
    required String label,
    required String confirmText,
    String cancelText = 'Cancel',
    String? initialValue,
    String? hintText,
  }) {
    return showDialog<String>(
      context: context,
      builder: (_) {
        return _TextInputDialog(
          title: title,
          label: label,
          confirmText: confirmText,
          cancelText: cancelText,
          initialValue: initialValue,
          hintText: hintText,
        );
      },
    );
  }

  // ============================================================
  // CONFIRMATION DIALOG
  // ============================================================

  static Future<bool> showConfirmation({
    required BuildContext context,
    required String title,
    required String message,
    required String confirmText,
    String cancelText = 'Cancel',
    bool isDestructive = false,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(false);
              },
              child: Text(cancelText),
            ),
            ElevatedButton(
              style: isDestructive
                  ? ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    )
                  : null,
              onPressed: () {
                Navigator.of(dialogContext).pop(true);
              },
              child: Text(confirmText),
            ),
          ],
        );
      },
    );

    return result ?? false;
  }

  // ============================================================
  // SELECTION DIALOG
  // ============================================================

  static Future<T?> showSelection<T>({
    required BuildContext context,
    required String title,
    required List<T> items,
    required String Function(T item) itemLabel,
  }) {
    return showDialog<T>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(title),
          content: SizedBox(
            width: double.maxFinite,
            height: 400,
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (_, __) {
                return const Divider(
                  height: 1,
                );
              },
              itemBuilder: (
                context,
                index,
              ) {
                final item = items[index];

                return ListTile(
                  leading: const Icon(
                    Icons.show_chart,
                  ),
                  title: Text(
                    itemLabel(item),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.add_circle_outline,
                  ),
                  onTap: () {
                    Navigator.of(dialogContext).pop(item);
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

// ============================================================================
// TEXT INPUT DIALOG
// ============================================================================

class _TextInputDialog extends StatefulWidget {
  const _TextInputDialog({
    required this.title,
    required this.label,
    required this.confirmText,
    required this.cancelText,
    this.initialValue,
    this.hintText,
  });

  final String title;
  final String label;
  final String confirmText;
  final String cancelText;
  final String? initialValue;
  final String? hintText;

  @override
  State<_TextInputDialog> createState() => _TextInputDialogState();
}

// ============================================================================
// STATE
// ============================================================================

class _TextInputDialogState
    extends State<_TextInputDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(
      text: widget.initialValue ?? '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  void _submit() {
    final value = _controller.text.trim();

    if (value.isEmpty) {
      return;
    }

    Navigator.of(context).pop(value);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),

      content: TextField(
        controller: _controller,
        autofocus: true,
        textInputAction: TextInputAction.done,
        onSubmitted: (_) {
          _submit();
        },
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hintText,
          border: const OutlineInputBorder(),
        ),
      ),

      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(widget.cancelText),
        ),

        ElevatedButton(
          onPressed: _submit,
          child: Text(widget.confirmText),
        ),
      ],
    );
  }
}