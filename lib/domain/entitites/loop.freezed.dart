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
      _$LoopCopyWithImpl<$Res>;
  $Res call({IList<Task> tasks, int sets});
}

/// @nodoc
class _$LoopCopyWithImpl<$Res> implements $LoopCopyWith<$Res> {
  _$LoopCopyWithImpl(this._value, this._then);

  final Loop _value;
  // ignore: unused_field
  final $Res Function(Loop) _then;

  @override
  $Res call({
    Object? tasks = freezed,
    Object? sets = freezed,
  }) {
    return _then(_value.copyWith(
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as IList<Task>,
      sets: sets == freezed
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_LoopCopyWith<$Res> implements $LoopCopyWith<$Res> {
  factory _$$_LoopCopyWith(_$_Loop value, $Res Function(_$_Loop) then) =
      __$$_LoopCopyWithImpl<$Res>;
  @override
  $Res call({IList<Task> tasks, int sets});
}

/// @nodoc
class __$$_LoopCopyWithImpl<$Res> extends _$LoopCopyWithImpl<$Res>
    implements _$$_LoopCopyWith<$Res> {
  __$$_LoopCopyWithImpl(_$_Loop _value, $Res Function(_$_Loop) _then)
      : super(_value, (v) => _then(v as _$_Loop));

  @override
  _$_Loop get _value => super._value as _$_Loop;

  @override
  $Res call({
    Object? tasks = freezed,
    Object? sets = freezed,
  }) {
    return _then(_$_Loop(
      tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as IList<Task>,
      sets == freezed
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Loop implements _Loop {
  _$_Loop(this.tasks, this.sets);

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
            const DeepCollectionEquality().equals(other.sets, sets));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(tasks),
      const DeepCollectionEquality().hash(sets));

  @JsonKey(ignore: true)
  @override
  _$$_LoopCopyWith<_$_Loop> get copyWith =>
      __$$_LoopCopyWithImpl<_$_Loop>(this, _$identity);
}

abstract class _Loop implements Loop {
  factory _Loop(final IList<Task> tasks, final int sets) = _$_Loop;

  @override
  IList<Task> get tasks;
  @override
  int get sets;
  @override
  @JsonKey(ignore: true)
  _$$_LoopCopyWith<_$_Loop> get copyWith => throw _privateConstructorUsedError;
}
