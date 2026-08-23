import '../repository/watchlist_repository.dart';

final class RenameWatchlist {
  RenameWatchlist(this._repository);

  final WatchlistRepository _repository;

  Future<void> call({
    required String id,
    required String name,
  }) {
    return _repository.renameWatchlist(
      id: id,
      name: name,
    );
  }
}