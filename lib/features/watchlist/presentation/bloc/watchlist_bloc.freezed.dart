// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WatchlistEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchlistEvent()';
}


}

/// @nodoc
class $WatchlistEventCopyWith<$Res>  {
$WatchlistEventCopyWith(WatchlistEvent _, $Res Function(WatchlistEvent) __);
}


/// Adds pattern-matching-related methods to [WatchlistEvent].
extension WatchlistEventPatterns on WatchlistEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _Create value)?  create,TResult Function( _Rename value)?  rename,TResult Function( _Delete value)?  delete,TResult Function( _AddStock value)?  addStock,TResult Function( _RemoveStock value)?  removeStock,TResult Function( _Reorder value)?  reorder,TResult Function( _ReorderWatchlists value)?  reorderWatchlists,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Create() when create != null:
return create(_that);case _Rename() when rename != null:
return rename(_that);case _Delete() when delete != null:
return delete(_that);case _AddStock() when addStock != null:
return addStock(_that);case _RemoveStock() when removeStock != null:
return removeStock(_that);case _Reorder() when reorder != null:
return reorder(_that);case _ReorderWatchlists() when reorderWatchlists != null:
return reorderWatchlists(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _Create value)  create,required TResult Function( _Rename value)  rename,required TResult Function( _Delete value)  delete,required TResult Function( _AddStock value)  addStock,required TResult Function( _RemoveStock value)  removeStock,required TResult Function( _Reorder value)  reorder,required TResult Function( _ReorderWatchlists value)  reorderWatchlists,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _Create():
return create(_that);case _Rename():
return rename(_that);case _Delete():
return delete(_that);case _AddStock():
return addStock(_that);case _RemoveStock():
return removeStock(_that);case _Reorder():
return reorder(_that);case _ReorderWatchlists():
return reorderWatchlists(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _Create value)?  create,TResult? Function( _Rename value)?  rename,TResult? Function( _Delete value)?  delete,TResult? Function( _AddStock value)?  addStock,TResult? Function( _RemoveStock value)?  removeStock,TResult? Function( _Reorder value)?  reorder,TResult? Function( _ReorderWatchlists value)?  reorderWatchlists,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Create() when create != null:
return create(_that);case _Rename() when rename != null:
return rename(_that);case _Delete() when delete != null:
return delete(_that);case _AddStock() when addStock != null:
return addStock(_that);case _RemoveStock() when removeStock != null:
return removeStock(_that);case _Reorder() when reorder != null:
return reorder(_that);case _ReorderWatchlists() when reorderWatchlists != null:
return reorderWatchlists(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String name)?  create,TResult Function( String id,  String name)?  rename,TResult Function( String id)?  delete,TResult Function( String watchlistId,  String symbol)?  addStock,TResult Function( String watchlistId,  String symbol)?  removeStock,TResult Function( String watchlistId,  int oldIndex,  int newIndex)?  reorder,TResult Function( int oldIndex,  int newIndex)?  reorderWatchlists,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Create() when create != null:
return create(_that.name);case _Rename() when rename != null:
return rename(_that.id,_that.name);case _Delete() when delete != null:
return delete(_that.id);case _AddStock() when addStock != null:
return addStock(_that.watchlistId,_that.symbol);case _RemoveStock() when removeStock != null:
return removeStock(_that.watchlistId,_that.symbol);case _Reorder() when reorder != null:
return reorder(_that.watchlistId,_that.oldIndex,_that.newIndex);case _ReorderWatchlists() when reorderWatchlists != null:
return reorderWatchlists(_that.oldIndex,_that.newIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String name)  create,required TResult Function( String id,  String name)  rename,required TResult Function( String id)  delete,required TResult Function( String watchlistId,  String symbol)  addStock,required TResult Function( String watchlistId,  String symbol)  removeStock,required TResult Function( String watchlistId,  int oldIndex,  int newIndex)  reorder,required TResult Function( int oldIndex,  int newIndex)  reorderWatchlists,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _Create():
return create(_that.name);case _Rename():
return rename(_that.id,_that.name);case _Delete():
return delete(_that.id);case _AddStock():
return addStock(_that.watchlistId,_that.symbol);case _RemoveStock():
return removeStock(_that.watchlistId,_that.symbol);case _Reorder():
return reorder(_that.watchlistId,_that.oldIndex,_that.newIndex);case _ReorderWatchlists():
return reorderWatchlists(_that.oldIndex,_that.newIndex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String name)?  create,TResult? Function( String id,  String name)?  rename,TResult? Function( String id)?  delete,TResult? Function( String watchlistId,  String symbol)?  addStock,TResult? Function( String watchlistId,  String symbol)?  removeStock,TResult? Function( String watchlistId,  int oldIndex,  int newIndex)?  reorder,TResult? Function( int oldIndex,  int newIndex)?  reorderWatchlists,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Create() when create != null:
return create(_that.name);case _Rename() when rename != null:
return rename(_that.id,_that.name);case _Delete() when delete != null:
return delete(_that.id);case _AddStock() when addStock != null:
return addStock(_that.watchlistId,_that.symbol);case _RemoveStock() when removeStock != null:
return removeStock(_that.watchlistId,_that.symbol);case _Reorder() when reorder != null:
return reorder(_that.watchlistId,_that.oldIndex,_that.newIndex);case _ReorderWatchlists() when reorderWatchlists != null:
return reorderWatchlists(_that.oldIndex,_that.newIndex);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements WatchlistEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchlistEvent.started()';
}


}




/// @nodoc


class _Create implements WatchlistEvent {
  const _Create({required this.name});
  

 final  String name;

/// Create a copy of WatchlistEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCopyWith<_Create> get copyWith => __$CreateCopyWithImpl<_Create>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Create&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'WatchlistEvent.create(name: $name)';
}


}

/// @nodoc
abstract mixin class _$CreateCopyWith<$Res> implements $WatchlistEventCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) _then) = __$CreateCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class __$CreateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(this._self, this._then);

  final _Create _self;
  final $Res Function(_Create) _then;

/// Create a copy of WatchlistEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_Create(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Rename implements WatchlistEvent {
  const _Rename({required this.id, required this.name});
  

 final  String id;
 final  String name;

/// Create a copy of WatchlistEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RenameCopyWith<_Rename> get copyWith => __$RenameCopyWithImpl<_Rename>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Rename&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'WatchlistEvent.rename(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$RenameCopyWith<$Res> implements $WatchlistEventCopyWith<$Res> {
  factory _$RenameCopyWith(_Rename value, $Res Function(_Rename) _then) = __$RenameCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$RenameCopyWithImpl<$Res>
    implements _$RenameCopyWith<$Res> {
  __$RenameCopyWithImpl(this._self, this._then);

  final _Rename _self;
  final $Res Function(_Rename) _then;

/// Create a copy of WatchlistEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_Rename(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Delete implements WatchlistEvent {
  const _Delete({required this.id});
  

 final  String id;

/// Create a copy of WatchlistEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteCopyWith<_Delete> get copyWith => __$DeleteCopyWithImpl<_Delete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Delete&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'WatchlistEvent.delete(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteCopyWith<$Res> implements $WatchlistEventCopyWith<$Res> {
  factory _$DeleteCopyWith(_Delete value, $Res Function(_Delete) _then) = __$DeleteCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$DeleteCopyWithImpl<$Res>
    implements _$DeleteCopyWith<$Res> {
  __$DeleteCopyWithImpl(this._self, this._then);

  final _Delete _self;
  final $Res Function(_Delete) _then;

/// Create a copy of WatchlistEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_Delete(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AddStock implements WatchlistEvent {
  const _AddStock({required this.watchlistId, required this.symbol});
  

 final  String watchlistId;
 final  String symbol;

/// Create a copy of WatchlistEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddStockCopyWith<_AddStock> get copyWith => __$AddStockCopyWithImpl<_AddStock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddStock&&(identical(other.watchlistId, watchlistId) || other.watchlistId == watchlistId)&&(identical(other.symbol, symbol) || other.symbol == symbol));
}


@override
int get hashCode => Object.hash(runtimeType,watchlistId,symbol);

@override
String toString() {
  return 'WatchlistEvent.addStock(watchlistId: $watchlistId, symbol: $symbol)';
}


}

/// @nodoc
abstract mixin class _$AddStockCopyWith<$Res> implements $WatchlistEventCopyWith<$Res> {
  factory _$AddStockCopyWith(_AddStock value, $Res Function(_AddStock) _then) = __$AddStockCopyWithImpl;
@useResult
$Res call({
 String watchlistId, String symbol
});




}
/// @nodoc
class __$AddStockCopyWithImpl<$Res>
    implements _$AddStockCopyWith<$Res> {
  __$AddStockCopyWithImpl(this._self, this._then);

  final _AddStock _self;
  final $Res Function(_AddStock) _then;

/// Create a copy of WatchlistEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? watchlistId = null,Object? symbol = null,}) {
  return _then(_AddStock(
watchlistId: null == watchlistId ? _self.watchlistId : watchlistId // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RemoveStock implements WatchlistEvent {
  const _RemoveStock({required this.watchlistId, required this.symbol});
  

 final  String watchlistId;
 final  String symbol;

/// Create a copy of WatchlistEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveStockCopyWith<_RemoveStock> get copyWith => __$RemoveStockCopyWithImpl<_RemoveStock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveStock&&(identical(other.watchlistId, watchlistId) || other.watchlistId == watchlistId)&&(identical(other.symbol, symbol) || other.symbol == symbol));
}


@override
int get hashCode => Object.hash(runtimeType,watchlistId,symbol);

@override
String toString() {
  return 'WatchlistEvent.removeStock(watchlistId: $watchlistId, symbol: $symbol)';
}


}

/// @nodoc
abstract mixin class _$RemoveStockCopyWith<$Res> implements $WatchlistEventCopyWith<$Res> {
  factory _$RemoveStockCopyWith(_RemoveStock value, $Res Function(_RemoveStock) _then) = __$RemoveStockCopyWithImpl;
@useResult
$Res call({
 String watchlistId, String symbol
});




}
/// @nodoc
class __$RemoveStockCopyWithImpl<$Res>
    implements _$RemoveStockCopyWith<$Res> {
  __$RemoveStockCopyWithImpl(this._self, this._then);

  final _RemoveStock _self;
  final $Res Function(_RemoveStock) _then;

/// Create a copy of WatchlistEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? watchlistId = null,Object? symbol = null,}) {
  return _then(_RemoveStock(
watchlistId: null == watchlistId ? _self.watchlistId : watchlistId // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Reorder implements WatchlistEvent {
  const _Reorder({required this.watchlistId, required this.oldIndex, required this.newIndex});
  

 final  String watchlistId;
 final  int oldIndex;
 final  int newIndex;

/// Create a copy of WatchlistEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReorderCopyWith<_Reorder> get copyWith => __$ReorderCopyWithImpl<_Reorder>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reorder&&(identical(other.watchlistId, watchlistId) || other.watchlistId == watchlistId)&&(identical(other.oldIndex, oldIndex) || other.oldIndex == oldIndex)&&(identical(other.newIndex, newIndex) || other.newIndex == newIndex));
}


@override
int get hashCode => Object.hash(runtimeType,watchlistId,oldIndex,newIndex);

@override
String toString() {
  return 'WatchlistEvent.reorder(watchlistId: $watchlistId, oldIndex: $oldIndex, newIndex: $newIndex)';
}


}

/// @nodoc
abstract mixin class _$ReorderCopyWith<$Res> implements $WatchlistEventCopyWith<$Res> {
  factory _$ReorderCopyWith(_Reorder value, $Res Function(_Reorder) _then) = __$ReorderCopyWithImpl;
@useResult
$Res call({
 String watchlistId, int oldIndex, int newIndex
});




}
/// @nodoc
class __$ReorderCopyWithImpl<$Res>
    implements _$ReorderCopyWith<$Res> {
  __$ReorderCopyWithImpl(this._self, this._then);

  final _Reorder _self;
  final $Res Function(_Reorder) _then;

/// Create a copy of WatchlistEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? watchlistId = null,Object? oldIndex = null,Object? newIndex = null,}) {
  return _then(_Reorder(
watchlistId: null == watchlistId ? _self.watchlistId : watchlistId // ignore: cast_nullable_to_non_nullable
as String,oldIndex: null == oldIndex ? _self.oldIndex : oldIndex // ignore: cast_nullable_to_non_nullable
as int,newIndex: null == newIndex ? _self.newIndex : newIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ReorderWatchlists implements WatchlistEvent {
  const _ReorderWatchlists({required this.oldIndex, required this.newIndex});
  

 final  int oldIndex;
 final  int newIndex;

/// Create a copy of WatchlistEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReorderWatchlistsCopyWith<_ReorderWatchlists> get copyWith => __$ReorderWatchlistsCopyWithImpl<_ReorderWatchlists>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReorderWatchlists&&(identical(other.oldIndex, oldIndex) || other.oldIndex == oldIndex)&&(identical(other.newIndex, newIndex) || other.newIndex == newIndex));
}


@override
int get hashCode => Object.hash(runtimeType,oldIndex,newIndex);

@override
String toString() {
  return 'WatchlistEvent.reorderWatchlists(oldIndex: $oldIndex, newIndex: $newIndex)';
}


}

/// @nodoc
abstract mixin class _$ReorderWatchlistsCopyWith<$Res> implements $WatchlistEventCopyWith<$Res> {
  factory _$ReorderWatchlistsCopyWith(_ReorderWatchlists value, $Res Function(_ReorderWatchlists) _then) = __$ReorderWatchlistsCopyWithImpl;
@useResult
$Res call({
 int oldIndex, int newIndex
});




}
/// @nodoc
class __$ReorderWatchlistsCopyWithImpl<$Res>
    implements _$ReorderWatchlistsCopyWith<$Res> {
  __$ReorderWatchlistsCopyWithImpl(this._self, this._then);

  final _ReorderWatchlists _self;
  final $Res Function(_ReorderWatchlists) _then;

/// Create a copy of WatchlistEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? oldIndex = null,Object? newIndex = null,}) {
  return _then(_ReorderWatchlists(
oldIndex: null == oldIndex ? _self.oldIndex : oldIndex // ignore: cast_nullable_to_non_nullable
as int,newIndex: null == newIndex ? _self.newIndex : newIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$WatchlistState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchlistState()';
}


}

/// @nodoc
class $WatchlistStateCopyWith<$Res>  {
$WatchlistStateCopyWith(WatchlistState _, $Res Function(WatchlistState) __);
}


/// Adds pattern-matching-related methods to [WatchlistState].
extension WatchlistStatePatterns on WatchlistState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<WatchlistEntity> watchlists)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.watchlists);case Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<WatchlistEntity> watchlists)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.watchlists);case Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<WatchlistEntity> watchlists)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.watchlists);case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements WatchlistState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchlistState.initial()';
}


}




/// @nodoc


class Loading implements WatchlistState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchlistState.loading()';
}


}




/// @nodoc


class Loaded implements WatchlistState {
  const Loaded({required  List<WatchlistEntity> watchlists}): _watchlists = watchlists;
  

 final  List<WatchlistEntity> _watchlists;
 List<WatchlistEntity> get watchlists {
  if (_watchlists is EqualUnmodifiableListView) return _watchlists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_watchlists);
}


/// Create a copy of WatchlistState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&const DeepCollectionEquality().equals(other._watchlists, _watchlists));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_watchlists));

@override
String toString() {
  return 'WatchlistState.loaded(watchlists: $watchlists)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $WatchlistStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 List<WatchlistEntity> watchlists
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of WatchlistState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? watchlists = null,}) {
  return _then(Loaded(
watchlists: null == watchlists ? _self._watchlists : watchlists // ignore: cast_nullable_to_non_nullable
as List<WatchlistEntity>,
  ));
}


}

/// @nodoc


class Error implements WatchlistState {
  const Error({required this.message});
  

 final  String message;

/// Create a copy of WatchlistState
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
  return 'WatchlistState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $WatchlistStateCopyWith<$Res> {
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

/// Create a copy of WatchlistState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
