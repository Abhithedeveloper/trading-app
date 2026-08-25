import '../entity/holding_entity.dart';
import '../repository/trading_repository.dart';

final class GetHoldings {
  GetHoldings({
    required TradingRepository repository,
  }) : _repository = repository;

  final TradingRepository _repository;

  Future<List<HoldingEntity>> call() {
    return _repository.getHoldings();
  }
}