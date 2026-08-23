import '../repository/watchlist_repository.dart';

final class RemoveStockFromWatchlist {
  RemoveStockFromWatchlist(this._repository);

  final WatchlistRepository _repository;

  Future<void> call({
    required String watchlistId,
    required String symbol,
  }) {
    return _repository.removeStock(
      watchlistId: watchlistId,
      symbol: symbol,
    );
  }
}