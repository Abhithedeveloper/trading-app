part of 'trading_bloc.dart';




@freezed
sealed class TradingEvent with _$TradingEvent {
  const factory TradingEvent.started() = _Started;

  const factory TradingEvent.buy({
    required String symbol,
    required int quantity,
    required double price,
  }) = _Buy;

  const factory TradingEvent.sell({
    required String symbol,
    required int quantity,
    required double price,
  }) = _Sell;
}