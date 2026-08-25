part of 'trading_bloc.dart';





@freezed
sealed class TradingState with _$TradingState {
  const factory TradingState.initial() = Initial;

  const factory TradingState.loading() = Loading;

  const factory TradingState.loaded({
    required List<HoldingEntity> holdings,
    String? message,
  }) = Loaded;

  const factory TradingState.error({
    required String message,
  }) = Error;
}
