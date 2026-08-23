import 'package:flutter/material.dart';

import '../../domain/entity/market_data_entity.dart';
import 'market_data_tile.dart';

class MarketDataList extends StatelessWidget {
  const MarketDataList({
    super.key,
    required this.marketData,
  });

  final Map<String, MarketDataEntity> marketData;

  @override
  Widget build(BuildContext context) {
    if (marketData.isEmpty) {
      return const Center(
        child: Text('No market data available'),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: marketData.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final data = marketData.values.elementAt(index);

        return MarketDataTile(data: data);
      },
    );
  }
}