// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WatchlistEntity {

 String get id; String get name; List<String> get symbols;
/// Create a copy of WatchlistEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchlistEntityCopyWith<WatchlistEntity> get copyWith => _$WatchlistEntityCopyWithImpl<WatchlistEntity>(this as WatchlistEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.symbols, symbols));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(symbols));

@override
String toString() {
  return 'WatchlistEntity(id: $id, name: $name, symbols: $symbols)';
}


}

/// @nodoc
abstract mixin class $WatchlistEntityCopyWith<$Res>  {
  factory $WatchlistEntityCopyWith(WatchlistEntity value, $Res Function(WatchlistEntity) _then) = _$WatchlistEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, List<String> symbols
});




}
/// @nodoc
class _$WatchlistEntityCopyWithImpl<$Res>
    implements $WatchlistEntityCopyWith<$Res> {
  _$WatchlistEntityCopyWithImpl(this._self, this._then);

  final WatchlistEntity _self;
  final $Res Function(WatchlistEntity) _then;

/// Create a copy of WatchlistEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? symbols = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,symbols: null == symbols ? _self.symbols : symbols // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [WatchlistEntity].
extension WatchlistEntityPatterns on WatchlistEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WatchlistEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WatchlistEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WatchlistEntity value)  $default,){
final _that = this;
switch (_that) {
case _WatchlistEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WatchlistEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WatchlistEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  List<String> symbols)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WatchlistEntity() when $default != null:
return $default(_that.id,_that.name,_that.symbols);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  List<String> symbols)  $default,) {final _that = this;
switch (_that) {
case _WatchlistEntity():
return $default(_that.id,_that.name,_that.symbols);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  List<String> symbols)?  $default,) {final _that = this;
switch (_that) {
case _WatchlistEntity() when $default != null:
return $default(_that.id,_that.name,_that.symbols);case _:
  return null;

}
}

}

/// @nodoc


class _WatchlistEntity implements WatchlistEntity {
  const _WatchlistEntity({required this.id, required this.name, required   List<String> symbols}): _symbols = symbols;
  

@override final  String id;
@override final  String name;
 final  List<String> _symbols;
@override List<String> get symbols {
  if (_symbols is EqualUnmodifiableListView) return _symbols;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_symbols);
}


/// Create a copy of WatchlistEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchlistEntityCopyWith<_WatchlistEntity> get copyWith => __$WatchlistEntityCopyWithImpl<_WatchlistEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchlistEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._symbols, _symbols));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_symbols));

@override
String toString() {
  return 'WatchlistEntity(id: $id, name: $name, symbols: $symbols)';
}


}

/// @nodoc
abstract mixin class _$WatchlistEntityCopyWith<$Res> implements $WatchlistEntityCopyWith<$Res> {
  factory _$WatchlistEntityCopyWith(_WatchlistEntity value, $Res Function(_WatchlistEntity) _then) = __$WatchlistEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, List<String> symbols
});




}
/// @nodoc
class __$WatchlistEntityCopyWithImpl<$Res>
    implements _$WatchlistEntityCopyWith<$Res> {
  __$WatchlistEntityCopyWithImpl(this._self, this._then);

  final _WatchlistEntity _self;
  final $Res Function(_WatchlistEntity) _then;

/// Create a copy of WatchlistEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? symbols = null,}) {
  return _then(_WatchlistEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,symbols: null == symbols ? _self._symbols : symbols // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
