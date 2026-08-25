import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';

class AddStockDialog extends StatelessWidget {
  const AddStockDialog({
    super.key,
    required this.onAdd,
  });

  final ValueChanged<String> onAdd;

  static const List<String> stocks = [
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

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        AppStrings.addStock,
      ),
      content: SizedBox(
        width: double.maxFinite,
        height: 400,
        child: ListView.separated(
          itemCount: stocks.length,
          separatorBuilder: (
            _,
            __,
          ) {
            return const Divider(
              height: 1,
            );
          },
          itemBuilder: (
            context,
            index,
          ) {
            final symbol = stocks[index];

            return ListTile(
              leading: const Icon(
                Icons.show_chart,
              ),
              title: Text(
                symbol,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(
                Icons.add_circle_outline,
              ),
              onTap: () {
                onAdd(symbol);

                Navigator.of(context).pop();
              },
            );
          },
        ),
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
      ],
    );
  }
}