part of 'market_data_bloc.dart';

@freezed
sealed class MarketDataState with _$MarketDataState {
  const factory MarketDataState.initial() = Initial;

  const factory MarketDataState.loading() = Loading;

  const factory MarketDataState.loaded(
    Map<String, MarketDataEntity> marketData,
  ) = Loaded;

  const factory MarketDataState.error(
    String message,
  ) = Error;
}
