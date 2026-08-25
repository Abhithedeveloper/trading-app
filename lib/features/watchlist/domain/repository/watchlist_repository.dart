
import 'package:trading_app/features/watchlist/domain/entity/watchlist_entity.dart';



abstract interface class WatchlistRepository {
  Future<List<WatchlistEntity>> getWatchlists();

  Future<void> createWatchlist(String name);

  Future<void> deleteWatchlist(String id);

  Future<void> renameWatchlist({
    required String id,
    required String name,
  });

  Future<void> addStock({
    required String watchlistId,
    required String symbol,
  });

  Future<void> removeStock({
    required String watchlistId,
    required String symbol,
  });

  Future<void> reorderStock({
    required String watchlistId,
    required int oldIndex,
    required int newIndex,
  });
  Future<void> reorderWatchlists({
  required int oldIndex,
  required int newIndex,
});
}