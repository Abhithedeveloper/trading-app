import 'package:trading_app/features/watchlist/data/model/dto/watchlist_dto.dart';
import 'package:trading_app/features/watchlist/domain/entity/watchlist_entity.dart';



import '../../domain/repository/watchlist_repository.dart';
import '../datasource/watchlist_local_datasource.dart';
import '../model/watchlist_model.dart';

final class WatchlistRepositoryImpl implements WatchlistRepository {
  WatchlistRepositoryImpl({
    required WatchlistLocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  final WatchlistLocalDataSource _localDataSource;

  @override
  Future<List<WatchlistEntity>> getWatchlists() async {
    final dtos = await _localDataSource.getWatchlists();

    return dtos
        .map(
          (dto) => WatchlistModel.fromDto(dto).toEntity(),
        )
        .toList();
  }

  @override
  Future<void> createWatchlist(String name) async {
    final watchlists = await _localDataSource.getWatchlists();

    final watchlist = WatchlistModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      symbols: const [],
    );

    watchlists.add(watchlist.toDto());

    await _localDataSource.saveWatchlists(watchlists);
  }

  @override
  Future<void> deleteWatchlist(String id) async {
    final watchlists = await _localDataSource.getWatchlists();

    watchlists.removeWhere(
      (watchlist) => watchlist.id == id,
    );

    await _localDataSource.saveWatchlists(watchlists);
  }

  @override
  Future<void> renameWatchlist({
    required String id,
    required String name,
  }) async {
    final watchlists = await _localDataSource.getWatchlists();

    final index = watchlists.indexWhere(
      (watchlist) => watchlist.id == id,
    );

    if (index == -1) {
      return;
    }

    final old = watchlists[index];

    watchlists[index] = WatchlistDto(
      id: old.id,
      name: name,
      symbols: old.symbols,
    );

    await _localDataSource.saveWatchlists(watchlists);
  }

  @override
  Future<void> addStock({
    required String watchlistId,
    required String symbol,
  }) async {
    final watchlists = await _localDataSource.getWatchlists();

    final index = watchlists.indexWhere(
      (watchlist) => watchlist.id == watchlistId,
    );

    if (index == -1) {
      return;
    }

    final watchlist = watchlists[index];

    if (watchlist.symbols.contains(symbol)) {
      return;
    }

    watchlists[index] = WatchlistDto(
      id: watchlist.id,
      name: watchlist.name,
      symbols: [
        ...watchlist.symbols,
        symbol,
      ],
    );

    await _localDataSource.saveWatchlists(watchlists);
  }

  @override
  Future<void> removeStock({
    required String watchlistId,
    required String symbol,
  }) async {
    final watchlists = await _localDataSource.getWatchlists();

    final index = watchlists.indexWhere(
      (watchlist) => watchlist.id == watchlistId,
    );

    if (index == -1) {
      return;
    }

    final watchlist = watchlists[index];

    watchlists[index] = WatchlistDto(
      id: watchlist.id,
      name: watchlist.name,
      symbols: watchlist.symbols
          .where((item) => item != symbol)
          .toList(),
    );

    await _localDataSource.saveWatchlists(watchlists);
  }

  @override
  Future<void> reorderStock({
    required String watchlistId,
    required int oldIndex,
    required int newIndex,
  }) async {
    final watchlists = await _localDataSource.getWatchlists();

    final index = watchlists.indexWhere(
      (watchlist) => watchlist.id == watchlistId,
    );

    if (index == -1) {
      return;
    }

    final watchlist = watchlists[index];

    final symbols = [...watchlist.symbols];

    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final symbol = symbols.removeAt(oldIndex);
    symbols.insert(newIndex, symbol);

    watchlists[index] = WatchlistDto(
      id: watchlist.id,
      name: watchlist.name,
      symbols: symbols,
    );

    await _localDataSource.saveWatchlists(watchlists);
  }
}