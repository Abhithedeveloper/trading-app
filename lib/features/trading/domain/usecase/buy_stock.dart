import '../repository/trading_repository.dart';

final class BuyStock {
  BuyStock({
    required TradingRepository repository,
  }) : _repository = repository;

  final TradingRepository _repository;

  Future<void> call({
    required String symbol,
    required int quantity,
    required double price,
  }) {
    return _repository.buy(
      symbol: symbol,
      quantity: quantity,
      price: price,
    );
  }
}