part of 'watchlist_bloc.dart';

@freezed
sealed class WatchlistEvent with _$WatchlistEvent {
  const factory WatchlistEvent.started() = _Started;

  const factory WatchlistEvent.create({
    required String name,
  }) = _Create;

  const factory WatchlistEvent.rename({
    required String id,
    required String name,
  }) = _Rename;

  const factory WatchlistEvent.delete({
    required String id,
  }) = _Delete;

  const factory WatchlistEvent.addStock({
    required String watchlistId,
    required String symbol,
  }) = _AddStock;

  const factory WatchlistEvent.removeStock({
    required String watchlistId,
    required String symbol,
  }) = _RemoveStock;

  const factory WatchlistEvent.reorder({
    required String watchlistId,
    required int oldIndex,
    required int newIndex,
  }) = _Reorder;

  const factory WatchlistEvent.reorderWatchlists({
    required int oldIndex,
    required int newIndex,
  }) = _ReorderWatchlists;
}