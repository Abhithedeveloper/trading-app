import 'dart:convert';

import '../../../../core/storage/local_storage.dart';
import '../../domain/entity/holding_entity.dart';

abstract interface class TradingLocalDataSource {
  Future<List<HoldingEntity>> getHoldings();

  Future<void> saveHoldings(
    List<HoldingEntity> holdings,
  );
}

final class TradingLocalDataSourceImpl
    implements TradingLocalDataSource {
  TradingLocalDataSourceImpl({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  final LocalStorage _localStorage;

  static const String _holdingsKey = 'trading_holdings';

  @override
  Future<List<HoldingEntity>> getHoldings() async {
    final jsonString = await _localStorage.getString(
      _holdingsKey,
    );

    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }

    final List<dynamic> jsonList = jsonDecode(jsonString);

    return jsonList.map((item) {
      final map = item as Map<String, dynamic>;

      return HoldingEntity(
        symbol: map['symbol'] as String,
        quantity: map['quantity'] as int,
        averagePrice: (map['averagePrice'] as num).toDouble(),
      );
    }).toList();
  }

  @override
  Future<void> saveHoldings(
    List<HoldingEntity> holdings,
  ) async {
    final jsonList = holdings.map((holding) {
      return {
        'symbol': holding.symbol,
        'quantity': holding.quantity,
        'averagePrice': holding.averagePrice,
      };
    }).toList();

    await _localStorage.setString(
      _holdingsKey,
      jsonEncode(jsonList),
    );
  }
}