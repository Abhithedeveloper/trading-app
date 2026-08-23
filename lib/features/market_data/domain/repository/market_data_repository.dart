import 'package:trading_app/features/market_data/domain/entity/market_data_entity.dart';



abstract interface class MarketDataRepository {
  Stream<MarketDataEntity> get marketDataStream;

  void startMarketData();

  void stopMarketData();
}