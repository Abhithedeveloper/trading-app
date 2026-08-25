


import '../entity/watchlist_entity.dart';
import '../repository/watchlist_repository.dart';

final class GetWatchlists {
  GetWatchlists(this.repository);

  final WatchlistRepository repository;

  Future<List<WatchlistEntity>> call() {
    return repository.getWatchlists();
  }
}