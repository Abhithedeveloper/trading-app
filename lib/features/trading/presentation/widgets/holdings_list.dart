import 'package:flutter/material.dart';
import 'package:trading_app/core/constants/app_strings.dart';

import '../../domain/entity/holding_entity.dart';

class HoldingsList extends StatelessWidget {
  const HoldingsList({
    super.key,
    required this.holdings,
  });

  final List<HoldingEntity> holdings;

  @override
  Widget build(BuildContext context) {
    if (holdings.isEmpty) {
      return const Center(
        child: Text(
          AppStrings.noHoldings,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      itemCount: holdings.length,
      separatorBuilder: (_, __) =>
          const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final holding = holdings[index];

        final investedValue =
            holding.quantity * holding.averagePrice;

        return Card(
          child: ListTile(
            title: Text(
              holding.symbol,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${holding.quantity} shares',
            ),
            trailing: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.end,
              children: [
                Text(
                  '₹${holding.averagePrice.toStringAsFixed(2)}',
                ),
                Text(
                  '₹${investedValue.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}