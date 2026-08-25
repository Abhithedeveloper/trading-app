import '../../domain/entity/market_data_entity.dart';

extension MarketDataEntityExtension on MarketDataEntity {
  String get formattedLtp {
    return '₹${ltp.toStringAsFixed(2)}';
  }

  String get formattedChange {
    final sign = change >= 0 ? '+' : '';

    return '$sign₹${change.toStringAsFixed(2)}';
  }

  String get formattedChangePercent {
    final sign = changePercent >= 0 ? '+' : '';

    return '$sign${changePercent.toStringAsFixed(2)}%';
  }
}