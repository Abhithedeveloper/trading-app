import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trading_app/features/market_data/domain/entity/market_data_entity.dart';
import 'package:trading_app/features/market_data/domain/usecase/get_market_data.dart';

part 'market_data_bloc.freezed.dart';
part 'market_data_event.dart';
part 'market_data_state.dart';

final class MarketDataBloc
    extends Bloc<MarketDataEvent, MarketDataState> {
  MarketDataBloc({
    required this._watchMarketDataUseCase,
  })  : super(const MarketDataState.initial()) {
    on<_Started>(_onStarted);
    on<_PriceUpdated>(_onPriceUpdated);
  }

  final WatchMarketDataUseCase _watchMarketDataUseCase;

  StreamSubscription<MarketDataEntity>? _subscription;

  Future<void> _onStarted(
    _Started event,
    Emitter<MarketDataState> emit,
  ) async {
    emit(const MarketDataState.loading());

    _watchMarketDataUseCase.start();

    await _subscription?.cancel();

    _subscription = _watchMarketDataUseCase().listen(
      (data) {
        add(MarketDataEvent.priceUpdated(data));
      },
      onError: (Object error) {
        addError(error);
      },
    );
  }

  void _onPriceUpdated(
    _PriceUpdated event,
    Emitter<MarketDataState> emit,
  ) {
    final currentData = switch (state) {
  Loaded(:final marketData) => marketData,
  _ => <String, MarketDataEntity>{},
};

    final updatedData = Map<String, MarketDataEntity>.from(currentData);

    updatedData[event.data.symbol] = event.data;

   emit(
  MarketDataState.loaded(
    marketData: updatedData,
  ),
);
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    _watchMarketDataUseCase.stop();

    return super.close();
  }
}
