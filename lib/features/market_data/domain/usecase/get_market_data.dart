import '../entity/market_data_entity.dart';
import '../repository/market_data_repository.dart';

final class WatchMarketDataUseCase {
  WatchMarketDataUseCase({
    required MarketDataRepository repository,
  }) : _repository = repository;

  final MarketDataRepository _repository;

  Stream<MarketDataEntity> call() {
    return _repository.marketDataStream;
  }

  void start() {
    _repository.startMarketData();
  }

  void stop() {
    _repository.stopMarketData();
  }
}