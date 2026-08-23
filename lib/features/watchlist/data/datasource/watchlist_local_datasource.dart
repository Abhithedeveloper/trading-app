import 'dart:convert';

import 'package:trading_app/core/storage/local_storage.dart';

import '../../../../core/constants/storage_keys.dart';

import '../model/dto/watchlist_dto.dart';

abstract interface class WatchlistLocalDataSource {
  Future<List<WatchlistDto>> getWatchlists();

  Future<void> saveWatchlists(List<WatchlistDto> watchlists);
}

final class WatchlistLocalDataSourceImpl
    implements WatchlistLocalDataSource {
  WatchlistLocalDataSourceImpl({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  final LocalStorage _localStorage;

  @override
  Future<List<WatchlistDto>> getWatchlists() async {
    final data = await _localStorage.getString(
      StorageKeys.watchlists,
    );

    if (data == null || data.isEmpty) {
      return [];
    }

    final jsonList = jsonDecode(data) as List<dynamic>;

    return jsonList
        .map(
          (json) => WatchlistDto.fromJson(
            json as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  @override
  Future<void> saveWatchlists(
    List<WatchlistDto> watchlists,
  ) async {
    final jsonList = watchlists
        .map((watchlist) => watchlist.toJson())
        .toList();

    await _localStorage.setString(
      StorageKeys.watchlists,
      jsonEncode(jsonList),
    );
  }
}