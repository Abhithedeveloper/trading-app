import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_data_entity.freezed.dart';


@freezed
abstract class MarketDataEntity with _$MarketDataEntity {
  const factory MarketDataEntity({
    required String symbol,
    required double ltp,
    required double change,
    required double changePercent,
  }) = _MarketDataEntity;
}