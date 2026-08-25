// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trading_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TradingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TradingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TradingEvent()';
}


}

/// @nodoc
class $TradingEventCopyWith<$Res>  {
$TradingEventCopyWith(TradingEvent _, $Res Function(TradingEvent) __);
}


/// Adds pattern-matching-related methods to [TradingEvent].
extension TradingEventPatterns on TradingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _Buy value)?  buy,TResult Function( _Sell value)?  sell,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Buy() when buy != null:
return buy(_that);case _Sell() when sell != null:
return sell(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _Buy value)  buy,required TResult Function( _Sell value)  sell,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _Buy():
return buy(_that);case _Sell():
return sell(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _Buy value)?  buy,TResult? Function( _Sell value)?  sell,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Buy() when buy != null:
return buy(_that);case _Sell() when sell != null:
return sell(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String symbol,  int quantity,  double price)?  buy,TResult Function( String symbol,  int quantity,  double price)?  sell,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Buy() when buy != null:
return buy(_that.symbol,_that.quantity,_that.price);case _Sell() when sell != null:
return sell(_that.symbol,_that.quantity,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String symbol,  int quantity,  double price)  buy,required TResult Function( String symbol,  int quantity,  double price)  sell,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _Buy():
return buy(_that.symbol,_that.quantity,_that.price);case _Sell():
return sell(_that.symbol,_that.quantity,_that.price);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String symbol,  int quantity,  double price)?  buy,TResult? Function( String symbol,  int quantity,  double price)?  sell,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Buy() when buy != null:
return buy(_that.symbol,_that.quantity,_that.price);case _Sell() when sell != null:
return sell(_that.symbol,_that.quantity,_that.price);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements TradingEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TradingEvent.started()';
}


}




/// @nodoc


class _Buy implements TradingEvent {
  const _Buy({required this.symbol, required this.quantity, required this.price});
  

 final  String symbol;
 final  int quantity;
 final  double price;

/// Create a copy of TradingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuyCopyWith<_Buy> get copyWith => __$BuyCopyWithImpl<_Buy>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Buy&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price));
}


@override
int get hashCode => Object.hash(runtimeType,symbol,quantity,price);

@override
String toString() {
  return 'TradingEvent.buy(symbol: $symbol, quantity: $quantity, price: $price)';
}


}

/// @nodoc
abstract mixin class _$BuyCopyWith<$Res> implements $TradingEventCopyWith<$Res> {
  factory _$BuyCopyWith(_Buy value, $Res Function(_Buy) _then) = __$BuyCopyWithImpl;
@useResult
$Res call({
 String symbol, int quantity, double price
});




}
/// @nodoc
class __$BuyCopyWithImpl<$Res>
    implements _$BuyCopyWith<$Res> {
  __$BuyCopyWithImpl(this._self, this._then);

  final _Buy _self;
  final $Res Function(_Buy) _then;

/// Create a copy of TradingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? quantity = null,Object? price = null,}) {
  return _then(_Buy(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _Sell implements TradingEvent {
  const _Sell({required this.symbol, required this.quantity, required this.price});
  

 final  String symbol;
 final  int quantity;
 final  double price;

/// Create a copy of TradingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellCopyWith<_Sell> get copyWith => __$SellCopyWithImpl<_Sell>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sell&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price));
}


@override
int get hashCode => Object.hash(runtimeType,symbol,quantity,price);

@override
String toString() {
  return 'TradingEvent.sell(symbol: $symbol, quantity: $quantity, price: $price)';
}


}

/// @nodoc
abstract mixin class _$SellCopyWith<$Res> implements $TradingEventCopyWith<$Res> {
  factory _$SellCopyWith(_Sell value, $Res Function(_Sell) _then) = __$SellCopyWithImpl;
@useResult
$Res call({
 String symbol, int quantity, double price
});




}
/// @nodoc
class __$SellCopyWithImpl<$Res>
    implements _$SellCopyWith<$Res> {
  __$SellCopyWithImpl(this._self, this._then);

  final _Sell _self;
  final $Res Function(_Sell) _then;

/// Create a copy of TradingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? quantity = null,Object? price = null,}) {
  return _then(_Sell(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$TradingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TradingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TradingState()';
}


}

/// @nodoc
class $TradingStateCopyWith<$Res>  {
$TradingStateCopyWith(TradingState _, $Res Function(TradingState) __);
}


/// Adds pattern-matching-related methods to [TradingState].
extension TradingStatePatterns on TradingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case Error():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<HoldingEntity> holdings)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.holdings);case Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<HoldingEntity> holdings)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.holdings);case Error():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<HoldingEntity> holdings)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.holdings);case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements TradingState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TradingState.initial()';
}


}




/// @nodoc


class Loading implements TradingState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TradingState.loading()';
}


}




/// @nodoc


class Loaded implements TradingState {
  const Loaded({required  List<HoldingEntity> holdings}): _holdings = holdings;
  

 final  List<HoldingEntity> _holdings;
 List<HoldingEntity> get holdings {
  if (_holdings is EqualUnmodifiableListView) return _holdings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_holdings);
}


/// Create a copy of TradingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&const DeepCollectionEquality().equals(other._holdings, _holdings));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_holdings));

@override
String toString() {
  return 'TradingState.loaded(holdings: $holdings)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $TradingStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 List<HoldingEntity> holdings
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of TradingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? holdings = null,}) {
  return _then(Loaded(
holdings: null == holdings ? _self._holdings : holdings // ignore: cast_nullable_to_non_nullable
as List<HoldingEntity>,
  ));
}


}

/// @nodoc


class Error implements TradingState {
  const Error({required this.message});
  

 final  String message;

/// Create a copy of TradingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TradingState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $TradingStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of TradingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
