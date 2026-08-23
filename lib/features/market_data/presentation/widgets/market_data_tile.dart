import 'package:flutter/material.dart';

import '../../domain/entity/market_data_entity.dart';

class MarketDataTile extends StatelessWidget {
  const MarketDataTile({
    super.key,
    required this.data,
  });

  final MarketDataEntity data;

  @override
  Widget build(BuildContext context) {
    final isPositive = data.change >= 0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.symbol,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${data.change >= 0 ? '+' : ''}'
                  '${data.change.toStringAsFixed(2)} '
                  '(${data.change >= 0 ? '+' : ''}'
                  '${data.changePercent.toStringAsFixed(2)}%)',
                  style: TextStyle(
                    color: isPositive ? Colors.green : Colors.red,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '₹${data.ltp.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}