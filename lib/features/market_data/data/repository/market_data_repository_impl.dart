import 'package:trading_app/features/market_data/data/data_source/mock_market_data_source.dart';

import '../../domain/entity/market_data_entity.dart';
import '../../domain/repository/market_data_repository.dart';


final class MarketDataRepositoryImpl implements MarketDataRepository {
  MarketDataRepositoryImpl({
    required MarketDataDataSource dataSource,
  }) : _dataSource = dataSource;

  final MarketDataDataSource _dataSource;

  @override
  Stream<MarketDataEntity> get marketDataStream {
    return _dataSource.marketDataStream;
  }

  @override
  void startMarketData() {
    _dataSource.start();
  }

  @override
  void stopMarketData() {
    _dataSource.stop();
  }
}