// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'loop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Loop {
  IList<Task> get tasks => throw _privateConstructorUsedError;
  int get sets => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoopCopyWith<Loop> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoopCopyWith<$Res> {
  factory $LoopCopyWith(Loop value, $Res Function(Loop) then) =
      _$LoopCopyWithImpl<$Res, Loop>;
  @useResult
  $Res call({IList<Task> tasks, int sets});
}

/// @nodoc
class _$LoopCopyWithImpl<$Res, $Val extends Loop>
    implements $LoopCopyWith<$Res> {
  _$LoopCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? sets = null,
  }) {
    return _then(_value.copyWith(
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as IList<Task>,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoopCopyWith<$Res> implements $LoopCopyWith<$Res> {
  factory _$$_LoopCopyWith(_$_Loop value, $Res Function(_$_Loop) then) =
      __$$_LoopCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IList<Task> tasks, int sets});
}

/// @nodoc
class __$$_LoopCopyWithImpl<$Res> extends _$LoopCopyWithImpl<$Res, _$_Loop>
    implements _$$_LoopCopyWith<$Res> {
  __$$_LoopCopyWithImpl(_$_Loop _value, $Res Function(_$_Loop) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? sets = null,
  }) {
    return _then(_$_Loop(
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as IList<Task>,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Loop extends _Loop {
  _$_Loop({required this.tasks, required this.sets}) : super._();

  @override
  final IList<Task> tasks;
  @override
  final int sets;

  @override
  String toString() {
    return 'Loop(tasks: $tasks, sets: $sets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loop &&
            const DeepCollectionEquality().equals(other.tasks, tasks) &&
            (identical(other.sets, sets) || other.sets == sets));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(tasks), sets);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoopCopyWith<_$_Loop> get copyWith =>
      __$$_LoopCopyWithImpl<_$_Loop>(this, _$identity);
}

abstract class _Loop extends Loop {
  factory _Loop({required final IList<Task> tasks, required final int sets}) =
      _$_Loop;
  _Loop._() : super._();

  @override
  IList<Task> get tasks;
  @override
  int get sets;
  @override
  @JsonKey(ignore: true)
  _$$_LoopCopyWith<_$_Loop> get copyWith => throw _privateConstructorUsedError;
}
