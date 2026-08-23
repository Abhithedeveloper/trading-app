


import '../entity/watchlist_entity.dart';
import '../repository/watchlist_repository.dart';

final class GetWatchlists {
  GetWatchlists(this._repository);

  final WatchlistRepository _repository;

  Future<List<WatchlistEntity>> call() {
    return _repository.getWatchlists();
  }
}