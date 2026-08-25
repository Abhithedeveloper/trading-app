import 'package:freezed_annotation/freezed_annotation.dart';

part 'holding_entity.freezed.dart';

@freezed
abstract class HoldingEntity with _$HoldingEntity {
  const factory HoldingEntity({
    required String symbol,
    required int quantity,
    required double averagePrice,
  }) = _HoldingEntity;
}