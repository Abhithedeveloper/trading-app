import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/holding_entity.dart';
import '../../domain/usecase/buy_stock.dart';
import '../../domain/usecase/get_holdings.dart';
import '../../domain/usecase/sell_stock.dart';

part 'trading_bloc.freezed.dart';
part 'trading_event.dart';
part 'trading_state.dart';

final class TradingBloc
    extends Bloc<TradingEvent, TradingState> {
  TradingBloc({
    required BuyStock buyStock,
    required SellStock sellStock,
    required GetHoldings getHoldings,
  })  : _buyStock = buyStock,
        _sellStock = sellStock,
        _getHoldings = getHoldings,
        super(const TradingState.initial()) {
    on<_Started>(_onStarted);
    on<_Buy>(_onBuy);
    on<_Sell>(_onSell);
  }

  final BuyStock _buyStock;
  final SellStock _sellStock;
  final GetHoldings _getHoldings;

  Future<void> _onStarted(
    _Started event,
    Emitter<TradingState> emit,
  ) async {
    await _loadHoldings(emit);
  }

  Future<void> _onBuy(
    _Buy event,
    Emitter<TradingState> emit,
  ) async {
    try {
      await _buyStock(
        symbol: event.symbol,
        quantity: event.quantity,
        price: event.price,
      );

      final holdings = await _getHoldings();

      emit(
        TradingState.loaded(
          holdings: holdings,
          message: '${event.symbol} bought successfully',
        ),
      );
    } catch (error) {
      await _emitTransactionError(
        error,
        emit,
      );
    }
  }

  Future<void> _onSell(
    _Sell event,
    Emitter<TradingState> emit,
  ) async {
    try {
      await _sellStock(
        symbol: event.symbol,
        quantity: event.quantity,
        price: event.price,
      );

      final holdings = await _getHoldings();

      emit(
        TradingState.loaded(
          holdings: holdings,
          message: '${event.symbol} sold successfully',
        ),
      );
    } catch (error) {
      await _emitTransactionError(
        error,
        emit,
      );
    }
  }

  Future<void> _emitTransactionError(
    Object error,
    Emitter<TradingState> emit,
  ) async {
    try {
      final holdings = await _getHoldings();

      emit(
        TradingState.loaded(
          holdings: holdings,
          message: _cleanErrorMessage(error),
        ),
      );
    } catch (_) {
      // If holdings cannot be loaded, keep the existing
      // UI state instead of replacing it with an error screen.
    }
  }

  Future<void> _loadHoldings(
    Emitter<TradingState> emit,
  ) async {
    emit(const TradingState.loading());

    try {
      final holdings = await _getHoldings();

      emit(
        TradingState.loaded(
          holdings: holdings,
        ),
      );
    } catch (error) {
      emit(
        TradingState.error(
          message: _cleanErrorMessage(error),
        ),
      );
    }
  }

  String _cleanErrorMessage(Object error) {
    final message = error.toString();

    if (message.startsWith('Exception: ')) {
      return message.substring('Exception: '.length);
    }

    return message;
  }
}