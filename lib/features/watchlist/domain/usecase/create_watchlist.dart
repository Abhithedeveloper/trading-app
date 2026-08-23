import '../repository/watchlist_repository.dart';

final class CreateWatchlist {
  CreateWatchlist(this._repository);

  final WatchlistRepository _repository;

  Future<void> call(String name) {
    return _repository.createWatchlist(name);
  }
}