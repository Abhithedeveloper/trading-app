part of 'trading_bloc.dart';

@freezed
class TradingEvent with _$TradingEvent {
  const factory TradingEvent.started() = _Started;
}