// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'preset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Preset {
  String get name => throw _privateConstructorUsedError;
  IList<Loop> get loops => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PresetCopyWith<Preset> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresetCopyWith<$Res> {
  factory $PresetCopyWith(Preset value, $Res Function(Preset) then) =
      _$PresetCopyWithImpl<$Res, Preset>;
  @useResult
  $Res call({String name, IList<Loop> loops});
}

/// @nodoc
class _$PresetCopyWithImpl<$Res, $Val extends Preset>
    implements $PresetCopyWith<$Res> {
  _$PresetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? loops = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      loops: null == loops
          ? _value.loops
          : loops // ignore: cast_nullable_to_non_nullable
              as IList<Loop>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PresetCopyWith<$Res> implements $PresetCopyWith<$Res> {
  factory _$$_PresetCopyWith(_$_Preset value, $Res Function(_$_Preset) then) =
      __$$_PresetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, IList<Loop> loops});
}

/// @nodoc
class __$$_PresetCopyWithImpl<$Res>
    extends _$PresetCopyWithImpl<$Res, _$_Preset>
    implements _$$_PresetCopyWith<$Res> {
  __$$_PresetCopyWithImpl(_$_Preset _value, $Res Function(_$_Preset) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? loops = null,
  }) {
    return _then(_$_Preset(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      loops: null == loops
          ? _value.loops
          : loops // ignore: cast_nullable_to_non_nullable
              as IList<Loop>,
    ));
  }
}

/// @nodoc

class _$_Preset extends _Preset {
  _$_Preset({required this.name, required this.loops}) : super._();

  @override
  final String name;
  @override
  final IList<Loop> loops;

  @override
  String toString() {
    return 'Preset(name: $name, loops: $loops)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Preset &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.loops, loops));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(loops));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PresetCopyWith<_$_Preset> get copyWith =>
      __$$_PresetCopyWithImpl<_$_Preset>(this, _$identity);
}

abstract class _Preset extends Preset {
  factory _Preset(
      {required final String name,
      required final IList<Loop> loops}) = _$_Preset;
  _Preset._() : super._();

  @override
  String get name;
  @override
  IList<Loop> get loops;
  @override
  @JsonKey(ignore: true)
  _$$_PresetCopyWith<_$_Preset> get copyWith =>
      throw _privateConstructorUsedError;
}
