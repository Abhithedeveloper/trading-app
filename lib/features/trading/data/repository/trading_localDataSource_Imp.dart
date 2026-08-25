import '../../domain/entity/holding_entity.dart';
import '../../domain/repository/trading_repository.dart';
import '../datasource/trading_local_datasource.dart';

final class TradingRepositoryImpl implements TradingRepository {
  TradingRepositoryImpl({
    required TradingLocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  final TradingLocalDataSource _localDataSource;

  @override
  Future<List<HoldingEntity>> getHoldings() {
    return _localDataSource.getHoldings();
  }

  @override
  Future<void> buy({
    required String symbol,
    required int quantity,
    required double price,
  }) async {
    final holdings = await _localDataSource.getHoldings();

    final index = holdings.indexWhere(
      (holding) => holding.symbol == symbol,
    );

    if (index == -1) {
      holdings.add(
        HoldingEntity(
          symbol: symbol,
          quantity: quantity,
          averagePrice: price,
        ),
      );
    } else {
      final existing = holdings[index];

      final totalQuantity = existing.quantity + quantity;

      final totalValue =
          (existing.quantity * existing.averagePrice) +
          (quantity * price);

      final averagePrice = totalValue / totalQuantity;

      holdings[index] = existing.copyWith(
        quantity: totalQuantity,
        averagePrice: averagePrice,
      );
    }

    await _localDataSource.saveHoldings(holdings);
  }

  @override
  Future<void> sell({
    required String symbol,
    required int quantity,
    required double price,
  }) async {
    final holdings = await _localDataSource.getHoldings();

    final index = holdings.indexWhere(
      (holding) => holding.symbol == symbol,
    );

    if (index == -1) {
      throw Exception('No holdings found for $symbol');
    }

    final existing = holdings[index];

    if (quantity > existing.quantity) {
      throw Exception(
        'Cannot sell more than available quantity',
      );
    }

    final remainingQuantity =
        existing.quantity - quantity;

    if (remainingQuantity == 0) {
      holdings.removeAt(index);
    } else {
      holdings[index] = existing.copyWith(
        quantity: remainingQuantity,
      );
    }

    await _localDataSource.saveHoldings(holdings);
  }
}