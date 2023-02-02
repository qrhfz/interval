// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quick_start_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuickStartState {
  int get workMins => throw _privateConstructorUsedError;
  int get workSecs => throw _privateConstructorUsedError;
  int get restMins => throw _privateConstructorUsedError;
  int get restSecs => throw _privateConstructorUsedError;
  int get sets => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuickStartStateCopyWith<QuickStartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuickStartStateCopyWith<$Res> {
  factory $QuickStartStateCopyWith(
          QuickStartState value, $Res Function(QuickStartState) then) =
      _$QuickStartStateCopyWithImpl<$Res, QuickStartState>;
  @useResult
  $Res call({int workMins, int workSecs, int restMins, int restSecs, int sets});
}

/// @nodoc
class _$QuickStartStateCopyWithImpl<$Res, $Val extends QuickStartState>
    implements $QuickStartStateCopyWith<$Res> {
  _$QuickStartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workMins = null,
    Object? workSecs = null,
    Object? restMins = null,
    Object? restSecs = null,
    Object? sets = null,
  }) {
    return _then(_value.copyWith(
      workMins: null == workMins
          ? _value.workMins
          : workMins // ignore: cast_nullable_to_non_nullable
              as int,
      workSecs: null == workSecs
          ? _value.workSecs
          : workSecs // ignore: cast_nullable_to_non_nullable
              as int,
      restMins: null == restMins
          ? _value.restMins
          : restMins // ignore: cast_nullable_to_non_nullable
              as int,
      restSecs: null == restSecs
          ? _value.restSecs
          : restSecs // ignore: cast_nullable_to_non_nullable
              as int,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuickStartStateCopyWith<$Res>
    implements $QuickStartStateCopyWith<$Res> {
  factory _$$_QuickStartStateCopyWith(
          _$_QuickStartState value, $Res Function(_$_QuickStartState) then) =
      __$$_QuickStartStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int workMins, int workSecs, int restMins, int restSecs, int sets});
}

/// @nodoc
class __$$_QuickStartStateCopyWithImpl<$Res>
    extends _$QuickStartStateCopyWithImpl<$Res, _$_QuickStartState>
    implements _$$_QuickStartStateCopyWith<$Res> {
  __$$_QuickStartStateCopyWithImpl(
      _$_QuickStartState _value, $Res Function(_$_QuickStartState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workMins = null,
    Object? workSecs = null,
    Object? restMins = null,
    Object? restSecs = null,
    Object? sets = null,
  }) {
    return _then(_$_QuickStartState(
      workMins: null == workMins
          ? _value.workMins
          : workMins // ignore: cast_nullable_to_non_nullable
              as int,
      workSecs: null == workSecs
          ? _value.workSecs
          : workSecs // ignore: cast_nullable_to_non_nullable
              as int,
      restMins: null == restMins
          ? _value.restMins
          : restMins // ignore: cast_nullable_to_non_nullable
              as int,
      restSecs: null == restSecs
          ? _value.restSecs
          : restSecs // ignore: cast_nullable_to_non_nullable
              as int,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_QuickStartState extends _QuickStartState {
  _$_QuickStartState(
      {this.workMins = 0,
      this.workSecs = 0,
      this.restMins = 0,
      this.restSecs = 0,
      this.sets = 0})
      : super._();

  @override
  @JsonKey()
  final int workMins;
  @override
  @JsonKey()
  final int workSecs;
  @override
  @JsonKey()
  final int restMins;
  @override
  @JsonKey()
  final int restSecs;
  @override
  @JsonKey()
  final int sets;

  @override
  String toString() {
    return 'QuickStartState(workMins: $workMins, workSecs: $workSecs, restMins: $restMins, restSecs: $restSecs, sets: $sets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuickStartState &&
            (identical(other.workMins, workMins) ||
                other.workMins == workMins) &&
            (identical(other.workSecs, workSecs) ||
                other.workSecs == workSecs) &&
            (identical(other.restMins, restMins) ||
                other.restMins == restMins) &&
            (identical(other.restSecs, restSecs) ||
                other.restSecs == restSecs) &&
            (identical(other.sets, sets) || other.sets == sets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, workMins, workSecs, restMins, restSecs, sets);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuickStartStateCopyWith<_$_QuickStartState> get copyWith =>
      __$$_QuickStartStateCopyWithImpl<_$_QuickStartState>(this, _$identity);
}

abstract class _QuickStartState extends QuickStartState {
  factory _QuickStartState(
      {final int workMins,
      final int workSecs,
      final int restMins,
      final int restSecs,
      final int sets}) = _$_QuickStartState;
  _QuickStartState._() : super._();

  @override
  int get workMins;
  @override
  int get workSecs;
  @override
  int get restMins;
  @override
  int get restSecs;
  @override
  int get sets;
  @override
  @JsonKey(ignore: true)
  _$$_QuickStartStateCopyWith<_$_QuickStartState> get copyWith =>
      throw _privateConstructorUsedError;
}
