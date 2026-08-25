import '../../domain/entity/watchlist_entity.dart';
import '../../domain/repository/watchlist_repository.dart';
import '../datasource/watchlist_local_datasource.dart';
import '../model/dto/watchlist_dto.dart';
import '../model/watchlist_model.dart';

final class WatchlistRepositoryImpl
    implements WatchlistRepository {
  const WatchlistRepositoryImpl({
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
    final watchlists =
        await _localDataSource.getWatchlists();

    final watchlist = WatchlistModel(
      id: DateTime.now()
          .millisecondsSinceEpoch
          .toString(),
      name: name.trim(),
      symbols: const [],
    );

    watchlists.add(
      watchlist.toDto(),
    );

    await _localDataSource.saveWatchlists(
      watchlists,
    );
  }

  @override
  Future<void> deleteWatchlist(String id) async {
    final watchlists =
        await _localDataSource.getWatchlists();

    watchlists.removeWhere(
      (watchlist) => watchlist.id == id,
    );

    await _localDataSource.saveWatchlists(
      watchlists,
    );
  }

  @override
  Future<void> renameWatchlist({
    required String id,
    required String name,
  }) async {
    final watchlists =
        await _localDataSource.getWatchlists();

    final index = watchlists.indexWhere(
      (watchlist) => watchlist.id == id,
    );

    if (index == -1) {
      return;
    }

    final existing = watchlists[index];

    watchlists[index] = WatchlistDto(
      id: existing.id,
      name: name.trim(),
      symbols: List<String>.from(
        existing.symbols,
      ),
    );

    await _localDataSource.saveWatchlists(
      watchlists,
    );
  }

  @override
  Future<void> addStock({
    required String watchlistId,
    required String symbol,
  }) async {
    final watchlists =
        await _localDataSource.getWatchlists();

    final index = watchlists.indexWhere(
      (watchlist) => watchlist.id == watchlistId,
    );

    if (index == -1) {
      throw StateError(
        'Watchlist not found: $watchlistId',
      );
    }

    final existing = watchlists[index];

    final normalizedSymbol =
        symbol.trim().toUpperCase();

    if (normalizedSymbol.isEmpty) {
      return;
    }

    if (existing.symbols.contains(normalizedSymbol)) {
      return;
    }

    watchlists[index] = WatchlistDto(
      id: existing.id,
      name: existing.name,
      symbols: [
        ...existing.symbols,
        normalizedSymbol,
      ],
    );

    await _localDataSource.saveWatchlists(
      watchlists,
    );
  }

  @override
  Future<void> removeStock({
    required String watchlistId,
    required String symbol,
  }) async {
    final watchlists =
        await _localDataSource.getWatchlists();

    final index = watchlists.indexWhere(
      (watchlist) => watchlist.id == watchlistId,
    );

    if (index == -1) {
      throw StateError(
        'Watchlist not found: $watchlistId',
      );
    }

    final existing = watchlists[index];

    watchlists[index] = WatchlistDto(
      id: existing.id,
      name: existing.name,
      symbols: existing.symbols
          .where(
            (item) => item != symbol,
          )
          .toList(),
    );

    await _localDataSource.saveWatchlists(
      watchlists,
    );
  }

  @override
  Future<void> reorderStock({
    required String watchlistId,
    required int oldIndex,
    required int newIndex,
  }) async {
    final watchlists =
        await _localDataSource.getWatchlists();

    final watchlistIndex = watchlists.indexWhere(
      (watchlist) => watchlist.id == watchlistId,
    );

    if (watchlistIndex == -1) {
      throw StateError(
        'Watchlist not found: $watchlistId',
      );
    }

    final existing = watchlists[watchlistIndex];

    final symbols = [
      ...existing.symbols,
    ];

    if (symbols.length < 2) {
      return;
    }

    if (oldIndex < 0 ||
        oldIndex >= symbols.length) {
      return;
    }

    if (newIndex < 0 ||
        newIndex > symbols.length) {
      return;
    }

    if (oldIndex == newIndex ||
        oldIndex + 1 == newIndex) {
      return;
    }

    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final symbol = symbols.removeAt(oldIndex);

    if (newIndex > symbols.length) {
      newIndex = symbols.length;
    }

    symbols.insert(
      newIndex,
      symbol,
    );

    watchlists[watchlistIndex] = WatchlistDto(
      id: existing.id,
      name: existing.name,
      symbols: symbols,
    );

    await _localDataSource.saveWatchlists(
      watchlists,
    );
  }

  @override
  Future<void> reorderWatchlists({
    required int oldIndex,
    required int newIndex,
  }) async {
    final watchlists =
        await _localDataSource.getWatchlists();

    if (watchlists.length < 2) {
      return;
    }

    if (oldIndex < 0 ||
        oldIndex >= watchlists.length) {
      return;
    }

    if (newIndex < 0 ||
        newIndex > watchlists.length) {
      return;
    }

    if (oldIndex == newIndex ||
        oldIndex + 1 == newIndex) {
      return;
    }

    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final watchlist =
        watchlists.removeAt(oldIndex);

    if (newIndex > watchlists.length) {
      newIndex = watchlists.length;
    }

    watchlists.insert(
      newIndex,
      watchlist,
    );

    await _localDataSource.saveWatchlists(
      watchlists,
    );
  }
}