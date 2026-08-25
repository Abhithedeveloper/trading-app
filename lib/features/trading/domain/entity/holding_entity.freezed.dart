// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'holding_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HoldingEntity {

 String get symbol; int get quantity; double get averagePrice;
/// Create a copy of HoldingEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HoldingEntityCopyWith<HoldingEntity> get copyWith => _$HoldingEntityCopyWithImpl<HoldingEntity>(this as HoldingEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HoldingEntity&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.averagePrice, averagePrice) || other.averagePrice == averagePrice));
}


@override
int get hashCode => Object.hash(runtimeType,symbol,quantity,averagePrice);

@override
String toString() {
  return 'HoldingEntity(symbol: $symbol, quantity: $quantity, averagePrice: $averagePrice)';
}


}

/// @nodoc
abstract mixin class $HoldingEntityCopyWith<$Res>  {
  factory $HoldingEntityCopyWith(HoldingEntity value, $Res Function(HoldingEntity) _then) = _$HoldingEntityCopyWithImpl;
@useResult
$Res call({
 String symbol, int quantity, double averagePrice
});




}
/// @nodoc
class _$HoldingEntityCopyWithImpl<$Res>
    implements $HoldingEntityCopyWith<$Res> {
  _$HoldingEntityCopyWithImpl(this._self, this._then);

  final HoldingEntity _self;
  final $Res Function(HoldingEntity) _then;

/// Create a copy of HoldingEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? quantity = null,Object? averagePrice = null,}) {
  return _then(HoldingEntity(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,averagePrice: null == averagePrice ? _self.averagePrice : averagePrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [HoldingEntity].
extension HoldingEntityPatterns on HoldingEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HoldingEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HoldingEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HoldingEntity value)  $default,){
final _that = this;
switch (_that) {
case _HoldingEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HoldingEntity value)?  $default,){
final _that = this;
switch (_that) {
case _HoldingEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  int quantity,  double averagePrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HoldingEntity() when $default != null:
return $default(_that.symbol,_that.quantity,_that.averagePrice);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  int quantity,  double averagePrice)  $default,) {final _that = this;
switch (_that) {
case _HoldingEntity():
return $default(_that.symbol,_that.quantity,_that.averagePrice);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  int quantity,  double averagePrice)?  $default,) {final _that = this;
switch (_that) {
case _HoldingEntity() when $default != null:
return $default(_that.symbol,_that.quantity,_that.averagePrice);case _:
  return null;

}
}

}

/// @nodoc


class _HoldingEntity implements HoldingEntity {
  const _HoldingEntity({required this.symbol, required this.quantity, required this.averagePrice});
  

@override final  String symbol;
@override final  int quantity;
@override final  double averagePrice;

/// Create a copy of HoldingEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HoldingEntityCopyWith<_HoldingEntity> get copyWith => __$HoldingEntityCopyWithImpl<_HoldingEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HoldingEntity&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.averagePrice, averagePrice) || other.averagePrice == averagePrice));
}


@override
int get hashCode => Object.hash(runtimeType,symbol,quantity,averagePrice);

@override
String toString() {
  return 'HoldingEntity(symbol: $symbol, quantity: $quantity, averagePrice: $averagePrice)';
}


}

/// @nodoc
abstract mixin class _$HoldingEntityCopyWith<$Res> implements $HoldingEntityCopyWith<$Res> {
  factory _$HoldingEntityCopyWith(_HoldingEntity value, $Res Function(_HoldingEntity) _then) = __$HoldingEntityCopyWithImpl;
@override @useResult
$Res call({
 String symbol, int quantity, double averagePrice
});




}
/// @nodoc
class __$HoldingEntityCopyWithImpl<$Res>
    implements _$HoldingEntityCopyWith<$Res> {
  __$HoldingEntityCopyWithImpl(this._self, this._then);

  final _HoldingEntity _self;
  final $Res Function(_HoldingEntity) _then;

/// Create a copy of HoldingEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? quantity = null,Object? averagePrice = null,}) {
  return _then(_HoldingEntity(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,averagePrice: null == averagePrice ? _self.averagePrice : averagePrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
