import '../repository/watchlist_repository.dart';



final class ReorderWatchlists {
  const ReorderWatchlists({
    required WatchlistRepository repository,
  }) : _repository = repository;

  final WatchlistRepository _repository;

  Future<void> call({
    required int oldIndex,
    required int newIndex,
  }) {
    return _repository.reorderWatchlists(
      oldIndex: oldIndex,
      newIndex: newIndex,
    );
  }
}