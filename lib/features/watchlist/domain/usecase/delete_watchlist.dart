import '../repository/watchlist_repository.dart';

final class DeleteWatchlist {
  DeleteWatchlist(this._repository);

  final WatchlistRepository _repository;

  Future<void> call(String id) {
    return _repository.deleteWatchlist(id);
  }
}