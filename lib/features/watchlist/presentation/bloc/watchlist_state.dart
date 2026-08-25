part of 'watchlist_bloc.dart';



@freezed
sealed class WatchlistState with _$WatchlistState {
  const factory WatchlistState.initial() = Initial;

  const factory WatchlistState.loading() = Loading;

  const factory WatchlistState.loaded({
    required List<WatchlistEntity> watchlists,
  }) = Loaded;

  const factory WatchlistState.error({
    required String message,
  }) = Error;
}