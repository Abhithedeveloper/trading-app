part of 'market_data_bloc.dart';

@freezed
sealed class MarketDataEvent with _$MarketDataEvent {
  const factory MarketDataEvent.started() = _Started;

  const factory MarketDataEvent.priceUpdated(
    MarketDataEntity data,
  ) = _PriceUpdated;
}