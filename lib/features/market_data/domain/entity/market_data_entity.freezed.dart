// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MarketDataEntity {

 String get symbol; double get ltp; double get change; double get changePercent;
/// Create a copy of MarketDataEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketDataEntityCopyWith<MarketDataEntity> get copyWith => _$MarketDataEntityCopyWithImpl<MarketDataEntity>(this as MarketDataEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketDataEntity&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.ltp, ltp) || other.ltp == ltp)&&(identical(other.change, change) || other.change == change)&&(identical(other.changePercent, changePercent) || other.changePercent == changePercent));
}


@override
int get hashCode => Object.hash(runtimeType,symbol,ltp,change,changePercent);

@override
String toString() {
  return 'MarketDataEntity(symbol: $symbol, ltp: $ltp, change: $change, changePercent: $changePercent)';
}


}

/// @nodoc
abstract mixin class $MarketDataEntityCopyWith<$Res>  {
  factory $MarketDataEntityCopyWith(MarketDataEntity value, $Res Function(MarketDataEntity) _then) = _$MarketDataEntityCopyWithImpl;
@useResult
$Res call({
 String symbol, double ltp, double change, double changePercent
});




}
/// @nodoc
class _$MarketDataEntityCopyWithImpl<$Res>
    implements $MarketDataEntityCopyWith<$Res> {
  _$MarketDataEntityCopyWithImpl(this._self, this._then);

  final MarketDataEntity _self;
  final $Res Function(MarketDataEntity) _then;

/// Create a copy of MarketDataEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? ltp = null,Object? change = null,Object? changePercent = null,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,ltp: null == ltp ? _self.ltp : ltp // ignore: cast_nullable_to_non_nullable
as double,change: null == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as double,changePercent: null == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MarketDataEntity].
extension MarketDataEntityPatterns on MarketDataEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketDataEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketDataEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketDataEntity value)  $default,){
final _that = this;
switch (_that) {
case _MarketDataEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketDataEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MarketDataEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  double ltp,  double change,  double changePercent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketDataEntity() when $default != null:
return $default(_that.symbol,_that.ltp,_that.change,_that.changePercent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  double ltp,  double change,  double changePercent)  $default,) {final _that = this;
switch (_that) {
case _MarketDataEntity():
return $default(_that.symbol,_that.ltp,_that.change,_that.changePercent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  double ltp,  double change,  double changePercent)?  $default,) {final _that = this;
switch (_that) {
case _MarketDataEntity() when $default != null:
return $default(_that.symbol,_that.ltp,_that.change,_that.changePercent);case _:
  return null;

}
}

}

/// @nodoc


class _MarketDataEntity implements MarketDataEntity {
  const _MarketDataEntity({required this.symbol, required this.ltp, required this.change, required this.changePercent});
  

@override final  String symbol;
@override final  double ltp;
@override final  double change;
@override final  double changePercent;

/// Create a copy of MarketDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketDataEntityCopyWith<_MarketDataEntity> get copyWith => __$MarketDataEntityCopyWithImpl<_MarketDataEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketDataEntity&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.ltp, ltp) || other.ltp == ltp)&&(identical(other.change, change) || other.change == change)&&(identical(other.changePercent, changePercent) || other.changePercent == changePercent));
}


@override
int get hashCode => Object.hash(runtimeType,symbol,ltp,change,changePercent);

@override
String toString() {
  return 'MarketDataEntity(symbol: $symbol, ltp: $ltp, change: $change, changePercent: $changePercent)';
}


}

/// @nodoc
abstract mixin class _$MarketDataEntityCopyWith<$Res> implements $MarketDataEntityCopyWith<$Res> {
  factory _$MarketDataEntityCopyWith(_MarketDataEntity value, $Res Function(_MarketDataEntity) _then) = __$MarketDataEntityCopyWithImpl;
@override @useResult
$Res call({
 String symbol, double ltp, double change, double changePercent
});




}
/// @nodoc
class __$MarketDataEntityCopyWithImpl<$Res>
    implements _$MarketDataEntityCopyWith<$Res> {
  __$MarketDataEntityCopyWithImpl(this._self, this._then);

  final _MarketDataEntity _self;
  final $Res Function(_MarketDataEntity) _then;

/// Create a copy of MarketDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? ltp = null,Object? change = null,Object? changePercent = null,}) {
  return _then(_MarketDataEntity(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,ltp: null == ltp ? _self.ltp : ltp // ignore: cast_nullable_to_non_nullable
as double,change: null == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as double,changePercent: null == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
