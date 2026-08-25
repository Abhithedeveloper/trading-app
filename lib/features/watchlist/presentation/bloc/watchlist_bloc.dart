import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/watchlist_entity.dart';
import '../../domain/usecase/add_stock_to_watchlist.dart';
import '../../domain/usecase/create_watchlist.dart';
import '../../domain/usecase/delete_watchlist.dart';
import '../../domain/usecase/get_watchlists.dart';
import '../../domain/usecase/remove_stock_from_watchlist.dart';
import '../../domain/usecase/rename_watchlist.dart';
import '../../domain/usecase/reorder_watchlist.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';
part 'watchlist_bloc.freezed.dart';

final class WatchlistBloc
    extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc({
    required GetWatchlists getWatchlists,
    required CreateWatchlist createWatchlist,
    required DeleteWatchlist deleteWatchlist,
    required RenameWatchlist renameWatchlist,
    required AddStockToWatchlist addStockToWatchlist,
    required RemoveStockFromWatchlist removeStockFromWatchlist,
    required ReorderWatchlist reorderWatchlist,
  })  : _getWatchlists = getWatchlists,
        _createWatchlist = createWatchlist,
        _deleteWatchlist = deleteWatchlist,
        _renameWatchlist = renameWatchlist,
        _addStockToWatchlist = addStockToWatchlist,
        _removeStockFromWatchlist = removeStockFromWatchlist,
        _reorderWatchlist = reorderWatchlist,
        super(const WatchlistState.initial()) {
    on<_Started>(_onStarted);
    on<_Create>(_onCreate);
    on<_Rename>(_onRename);
    on<_Delete>(_onDelete);
    on<_AddStock>(_onAddStock);
    on<_RemoveStock>(_onRemoveStock);
    on<_Reorder>(_onReorder);
  }

  final GetWatchlists _getWatchlists;
  final CreateWatchlist _createWatchlist;
  final DeleteWatchlist _deleteWatchlist;
  final RenameWatchlist _renameWatchlist;
  final AddStockToWatchlist _addStockToWatchlist;
  final RemoveStockFromWatchlist _removeStockFromWatchlist;
  final ReorderWatchlist _reorderWatchlist;

  Future<void> _onStarted(
    _Started event,
    Emitter<WatchlistState> emit,
  ) async {
    emit(const WatchlistState.loading());

    try {
      final watchlists = await _getWatchlists();

      emit(
        WatchlistState.loaded(
          watchlists: watchlists,
        ),
      );
    } catch (error) {
      emit(
        WatchlistState.error(
          message: error.toString(),
        ),
      );
    }
  }

  Future<void> _onCreate(
    _Create event,
    Emitter<WatchlistState> emit,
  ) async {
    try {
      await _createWatchlist(event.name);
      await _reloadWatchlists(emit);
    } catch (error) {
      emit(
        WatchlistState.error(
          message: error.toString(),
        ),
      );
    }
  }

  Future<void> _onRename(
    _Rename event,
    Emitter<WatchlistState> emit,
  ) async {
    try {
      await _renameWatchlist(
        id: event.id,
        name: event.name,
      );

      await _reloadWatchlists(emit);
    } catch (error) {
      emit(
        WatchlistState.error(
          message: error.toString(),
        ),
      );
    }
  }

  Future<void> _onDelete(
    _Delete event,
    Emitter<WatchlistState> emit,
  ) async {
    try {
      await _deleteWatchlist(event.id);
      await _reloadWatchlists(emit);
    } catch (error) {
      emit(
        WatchlistState.error(
          message: error.toString(),
        ),
      );
    }
  }

  Future<void> _onAddStock(
    _AddStock event,
    Emitter<WatchlistState> emit,
  ) async {
    try {
      await _addStockToWatchlist(
        watchlistId: event.watchlistId,
        symbol: event.symbol,
      );

      await _reloadWatchlists(emit);
    } catch (error) {
      emit(
        WatchlistState.error(
          message: error.toString(),
        ),
      );
    }
  }

  Future<void> _onRemoveStock(
    _RemoveStock event,
    Emitter<WatchlistState> emit,
  ) async {
    try {
      await _removeStockFromWatchlist(
        watchlistId: event.watchlistId,
        symbol: event.symbol,
      );

      await _reloadWatchlists(emit);
    } catch (error) {
      emit(
        WatchlistState.error(
          message: error.toString(),
        ),
      );
    }
  }

Future<void> _onReorder(
  _Reorder event,
  Emitter<WatchlistState> emit,
) async {
  try {
    await _reorderWatchlist(
      watchlistId: event.watchlistId,
      oldIndex: event.oldIndex,
      newIndex: event.newIndex,
    );

    await _reloadWatchlists(emit);
  } catch (error) {
    emit(
      WatchlistState.error(
        message: error.toString(),
      ),
    );
  }
}

  Future<void> _reloadWatchlists(
    Emitter<WatchlistState> emit,
  ) async {
    final watchlists = await _getWatchlists();

    emit(
      WatchlistState.loaded(
        watchlists: watchlists,
      ),
    );
  }
}