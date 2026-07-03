// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todos_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodosState {

 List<Todo> get todos; bool get isLoading; String? get errorMessage;
/// Create a copy of TodosState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodosStateCopyWith<TodosState> get copyWith => _$TodosStateCopyWithImpl<TodosState>(this as TodosState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodosState&&const DeepCollectionEquality().equals(other.todos, todos)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(todos),isLoading,errorMessage);

@override
String toString() {
  return 'TodosState(todos: $todos, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $TodosStateCopyWith<$Res>  {
  factory $TodosStateCopyWith(TodosState value, $Res Function(TodosState) _then) = _$TodosStateCopyWithImpl;
@useResult
$Res call({
 List<Todo> todos, bool isLoading, String? errorMessage
});




}
/// @nodoc
class _$TodosStateCopyWithImpl<$Res>
    implements $TodosStateCopyWith<$Res> {
  _$TodosStateCopyWithImpl(this._self, this._then);

  final TodosState _self;
  final $Res Function(TodosState) _then;

/// Create a copy of TodosState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? todos = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
todos: null == todos ? _self.todos : todos // ignore: cast_nullable_to_non_nullable
as List<Todo>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TodosState].
extension TodosStatePatterns on TodosState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodosState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodosState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodosState value)  $default,){
final _that = this;
switch (_that) {
case _TodosState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodosState value)?  $default,){
final _that = this;
switch (_that) {
case _TodosState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Todo> todos,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodosState() when $default != null:
return $default(_that.todos,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Todo> todos,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _TodosState():
return $default(_that.todos,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Todo> todos,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _TodosState() when $default != null:
return $default(_that.todos,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _TodosState implements TodosState {
  const _TodosState({required final  List<Todo> todos, required this.isLoading, this.errorMessage}): _todos = todos;
  

 final  List<Todo> _todos;
@override List<Todo> get todos {
  if (_todos is EqualUnmodifiableListView) return _todos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_todos);
}

@override final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of TodosState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodosStateCopyWith<_TodosState> get copyWith => __$TodosStateCopyWithImpl<_TodosState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodosState&&const DeepCollectionEquality().equals(other._todos, _todos)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_todos),isLoading,errorMessage);

@override
String toString() {
  return 'TodosState(todos: $todos, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$TodosStateCopyWith<$Res> implements $TodosStateCopyWith<$Res> {
  factory _$TodosStateCopyWith(_TodosState value, $Res Function(_TodosState) _then) = __$TodosStateCopyWithImpl;
@override @useResult
$Res call({
 List<Todo> todos, bool isLoading, String? errorMessage
});




}
/// @nodoc
class __$TodosStateCopyWithImpl<$Res>
    implements _$TodosStateCopyWith<$Res> {
  __$TodosStateCopyWithImpl(this._self, this._then);

  final _TodosState _self;
  final $Res Function(_TodosState) _then;

/// Create a copy of TodosState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? todos = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_TodosState(
todos: null == todos ? _self._todos : todos // ignore: cast_nullable_to_non_nullable
as List<Todo>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
