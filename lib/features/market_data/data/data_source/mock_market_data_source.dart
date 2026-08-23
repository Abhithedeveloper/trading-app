import 'dart:async';
import 'dart:math';

import '../../domain/entity/market_data_entity.dart';

abstract interface class MarketDataDataSource {
  Stream<MarketDataEntity> get marketDataStream;

  void start();

  void stop();
}

final class MockMarketDataDataSource implements MarketDataDataSource {
  MockMarketDataDataSource();

  final _controller = StreamController<MarketDataEntity>.broadcast();

  final _random = Random();

  Timer? _timer;

  final Map<String, double> _initialPrices = {
    'RELIANCE': 1400.00,
    'TCS': 3500.00,
    'INFY': 1500.00,
    'HDFCBANK': 1700.00,
    'ICICIBANK': 1200.00,
    'SBIN': 800.00,
    'ITC': 500.00,
    'LT': 3600.00,
    'BHARTIARTL': 1800.00,
    'AXISBANK': 1100.00,
  };

  late final Map<String, double> _currentPrices =
      Map<String, double>.from(_initialPrices);

  @override
  Stream<MarketDataEntity> get marketDataStream => _controller.stream;

  @override
  void start() {
    if (_timer != null) {
      return;
    }

    _timer = Timer.periodic(
      const Duration(milliseconds: 500),
      (_) => _generateTicks(),
    );
  }

  void _generateTicks() {
    for (final symbol in _currentPrices.keys) {
      final oldPrice = _currentPrices[symbol]!;

      final movement = (_random.nextDouble() - 0.5) * 2;

      final newPrice = max(
        0.01,
        oldPrice + movement,
      );

      _currentPrices[symbol] = newPrice;

      final initialPrice = _initialPrices[symbol]!;

      final change = newPrice - initialPrice;

      final changePercent = (change / initialPrice) * 100;

      _controller.add(
        MarketDataEntity(
          symbol: symbol,
          ltp: newPrice,
          change: change,
          changePercent: changePercent,
        ),
      );
    }
  }

  @override
  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> dispose() async {
    stop();
    await _controller.close();
  }
}