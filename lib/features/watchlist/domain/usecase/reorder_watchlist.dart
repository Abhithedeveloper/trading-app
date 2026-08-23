import '../repository/watchlist_repository.dart';

final class ReorderWatchlist {
  ReorderWatchlist(this._repository);

  final WatchlistRepository _repository;

  Future<void> call({
    required String watchlistId,
    required int oldIndex,
    required int newIndex,
  }) {
    return _repository.reorderStock(
      watchlistId: watchlistId,
      oldIndex: oldIndex,
      newIndex: newIndex,
    );
  }
}