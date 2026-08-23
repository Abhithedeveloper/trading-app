import '../repository/watchlist_repository.dart';

final class AddStockToWatchlist {
  AddStockToWatchlist(this._repository);

  final WatchlistRepository _repository;

  Future<void> call({
    required String watchlistId,
    required String symbol,
  }) {
    return _repository.addStock(
      watchlistId: watchlistId,
      symbol: symbol,
    );
  }
}