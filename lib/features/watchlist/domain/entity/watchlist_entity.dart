import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist_entity.freezed.dart';

@freezed
abstract class WatchlistEntity with _$WatchlistEntity {
  const factory WatchlistEntity({
    required String id,
    required String name,
    required List<String> symbols,
  }) = _WatchlistEntity;
}