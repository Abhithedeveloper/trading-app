import '../entity/holding_entity.dart';

abstract interface class TradingRepository {
  Future<List<HoldingEntity>> getHoldings();

  Future<void> buy({
    required String symbol,
    required int quantity,
    required double price,
  });

  Future<void> sell({
    required String symbol,
    required int quantity,
    required double price,
  });
}