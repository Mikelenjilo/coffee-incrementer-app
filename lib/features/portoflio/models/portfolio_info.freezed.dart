// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PortfolioInfo {

 String get name; int get coffeeCounter; String get description;
/// Create a copy of PortfolioInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioInfoCopyWith<PortfolioInfo> get copyWith => _$PortfolioInfoCopyWithImpl<PortfolioInfo>(this as PortfolioInfo, _$identity);

  /// Serializes this PortfolioInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.coffeeCounter, coffeeCounter) || other.coffeeCounter == coffeeCounter)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,coffeeCounter,description);

@override
String toString() {
  return 'PortfolioInfo(name: $name, coffeeCounter: $coffeeCounter, description: $description)';
}


}

/// @nodoc
abstract mixin class $PortfolioInfoCopyWith<$Res>  {
  factory $PortfolioInfoCopyWith(PortfolioInfo value, $Res Function(PortfolioInfo) _then) = _$PortfolioInfoCopyWithImpl;
@useResult
$Res call({
 String name, int coffeeCounter, String description
});




}
/// @nodoc
class _$PortfolioInfoCopyWithImpl<$Res>
    implements $PortfolioInfoCopyWith<$Res> {
  _$PortfolioInfoCopyWithImpl(this._self, this._then);

  final PortfolioInfo _self;
  final $Res Function(PortfolioInfo) _then;

/// Create a copy of PortfolioInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? coffeeCounter = null,Object? description = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coffeeCounter: null == coffeeCounter ? _self.coffeeCounter : coffeeCounter // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PortfolioInfo].
extension PortfolioInfoPatterns on PortfolioInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioInfo value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int coffeeCounter,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortfolioInfo() when $default != null:
return $default(_that.name,_that.coffeeCounter,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int coffeeCounter,  String description)  $default,) {final _that = this;
switch (_that) {
case _PortfolioInfo():
return $default(_that.name,_that.coffeeCounter,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int coffeeCounter,  String description)?  $default,) {final _that = this;
switch (_that) {
case _PortfolioInfo() when $default != null:
return $default(_that.name,_that.coffeeCounter,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PortfolioInfo implements PortfolioInfo {
  const _PortfolioInfo({required this.name, required this.coffeeCounter, required this.description});
  factory _PortfolioInfo.fromJson(Map<String, dynamic> json) => _$PortfolioInfoFromJson(json);

@override final  String name;
@override final  int coffeeCounter;
@override final  String description;

/// Create a copy of PortfolioInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioInfoCopyWith<_PortfolioInfo> get copyWith => __$PortfolioInfoCopyWithImpl<_PortfolioInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PortfolioInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.coffeeCounter, coffeeCounter) || other.coffeeCounter == coffeeCounter)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,coffeeCounter,description);

@override
String toString() {
  return 'PortfolioInfo(name: $name, coffeeCounter: $coffeeCounter, description: $description)';
}


}

/// @nodoc
abstract mixin class _$PortfolioInfoCopyWith<$Res> implements $PortfolioInfoCopyWith<$Res> {
  factory _$PortfolioInfoCopyWith(_PortfolioInfo value, $Res Function(_PortfolioInfo) _then) = __$PortfolioInfoCopyWithImpl;
@override @useResult
$Res call({
 String name, int coffeeCounter, String description
});




}
/// @nodoc
class __$PortfolioInfoCopyWithImpl<$Res>
    implements _$PortfolioInfoCopyWith<$Res> {
  __$PortfolioInfoCopyWithImpl(this._self, this._then);

  final _PortfolioInfo _self;
  final $Res Function(_PortfolioInfo) _then;

/// Create a copy of PortfolioInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? coffeeCounter = null,Object? description = null,}) {
  return _then(_PortfolioInfo(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coffeeCounter: null == coffeeCounter ? _self.coffeeCounter : coffeeCounter // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
