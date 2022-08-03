// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'interval_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IntervalState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            IList<Loop> loops, int loopIndex, int set, int taskIndex)
        running,
    required TResult Function(
            IList<Loop> loops, int loopIndex, int set, int taskIndex)
        paused,
    required TResult Function() finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(IList<Loop> loops, int loopIndex, int set, int taskIndex)?
        running,
    TResult Function(IList<Loop> loops, int loopIndex, int set, int taskIndex)?
        paused,
    TResult Function()? finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(IList<Loop> loops, int loopIndex, int set, int taskIndex)?
        running,
    TResult Function(IList<Loop> loops, int loopIndex, int set, int taskIndex)?
        paused,
    TResult Function()? finished,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Running value) running,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Finished value) finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Running value)? running,
    TResult Function(_Paused value)? paused,
    TResult Function(_Finished value)? finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Running value)? running,
    TResult Function(_Paused value)? paused,
    TResult Function(_Finished value)? finished,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntervalStateCopyWith<$Res> {
  factory $IntervalStateCopyWith(
          IntervalState value, $Res Function(IntervalState) then) =
      _$IntervalStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$IntervalStateCopyWithImpl<$Res>
    implements $IntervalStateCopyWith<$Res> {
  _$IntervalStateCopyWithImpl(this._value, this._then);

  final IntervalState _value;
  // ignore: unused_field
  final $Res Function(IntervalState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$IntervalStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'IntervalState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            IList<Loop> loops, int loopIndex, int set, int taskIndex)
        running,
    required TResult Function(
            IList<Loop> loops, int loopIndex, int set, int taskIndex)
        paused,
    required TResult Function() finished,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(IList<Loop> loops, int loopIndex, int set, int taskIndex)?
        running,
    TResult Function(IList<Loop> loops, int loopIndex, int set, int taskIndex)?
        paused,
    TResult Function()? finished,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(IList<Loop> loops, int loopIndex, int set, int taskIndex)?
        running,
    TResult Function(IList<Loop> loops, int loopIndex, int set, int taskIndex)?
        paused,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Running value) running,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Finished value) finished,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Running value)? running,
    TResult Function(_Paused value)? paused,
    TResult Function(_Finished value)? finished,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Running value)? running,
    TResult Function(_Paused value)? paused,
    TResult Function(_Finished value)? finished,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements IntervalState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_RunningCopyWith<$Res> {
  factory _$$_RunningCopyWith(
          _$_Running value, $Res Function(_$_Running) then) =
      __$$_RunningCopyWithImpl<$Res>;
  $Res call({IList<Loop> loops, int loopIndex, int set, int taskIndex});
}

/// @nodoc
class __$$_RunningCopyWithImpl<$Res> extends _$IntervalStateCopyWithImpl<$Res>
    implements _$$_RunningCopyWith<$Res> {
  __$$_RunningCopyWithImpl(_$_Running _value, $Res Function(_$_Running) _then)
      : super(_value, (v) => _then(v as _$_Running));

  @override
  _$_Running get _value => super._value as _$_Running;

  @override
  $Res call({
    Object? loops = freezed,
    Object? loopIndex = freezed,
    Object? set = freezed,
    Object? taskIndex = freezed,
  }) {
    return _then(_$_Running(
      loops == freezed
          ? _value.loops
          : loops // ignore: cast_nullable_to_non_nullable
              as IList<Loop>,
      loopIndex == freezed
          ? _value.loopIndex
          : loopIndex // ignore: cast_nullable_to_non_nullable
              as int,
      set == freezed
          ? _value.set
          : set // ignore: cast_nullable_to_non_nullable
              as int,
      taskIndex == freezed
          ? _value.taskIndex
          : taskIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Running implements _Running {
  const _$_Running(this.loops, this.loopIndex, this.set, this.taskIndex);

  @override
  final IList<Loop> loops;
  @override
  final int loopIndex;
  @override
  final int set;
  @override
  final int taskIndex;

  @override
  String toString() {
    return 'IntervalState.running(loops: $loops, loopIndex: $loopIndex, set: $set, taskIndex: $taskIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Running &&
            const DeepCollectionEquality().equals(other.loops, loops) &&
            const DeepCollectionEquality().equals(other.loopIndex, loopIndex) &&
            const DeepCollectionEquality().equals(other.set, set) &&
            const DeepCollectionEquality().equals(other.taskIndex, taskIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loops),
      const DeepCollectionEquality().hash(loopIndex),
      const DeepCollectionEquality().hash(set),
      const DeepCollectionEquality().hash(taskIndex));

  @JsonKey(ignore: true)
  @override
  _$$_RunningCopyWith<_$_Running> get copyWith =>
      __$$_RunningCopyWithImpl<_$_Running>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            IList<Loop> loops, int loopIndex, int set, int taskIndex)
        running,
    required TResult Function(
            IList<Loop> loops, int loopIndex, int set, int taskIndex)
        paused,
    required TResult Function() finished,
  }) {
    return running(loops, loopIndex, set, taskIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(IList<Loop> loops, int loopIndex, int set, int taskIndex)?
        running,
    TResult Function(IList<Loop> loops, int loopIndex, int set, int taskIndex)?
        paused,
    TResult Function()? finished,
  }) {
    return running?.call(loops, loopIndex, set, taskIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(IList<Loop> loops, int loopIndex, int set, int taskIndex)?
        running,
    TResult Function(IList<Loop> loops, int loopIndex, int set, int taskIndex)?
        paused,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(loops, loopIndex, set, taskIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Running value) running,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Finished value) finished,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Running value)? running,
    TResult Function(_Paused value)? paused,
    TResult Function(_Finished value)? finished,
  }) {
    return running?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Running value)? running,
    TResult Function(_Paused value)? paused,
    TResult Function(_Finished value)? finished,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(this);
    }
    return orElse();
  }
}

abstract class _Running implements IntervalState {
  const factory _Running(final IList<Loop> loops, final int loopIndex,
      final int set, final int taskIndex) = _$_Running;

  IList<Loop> get loops;
  int get loopIndex;
  int get set;
  int get taskIndex;
  @JsonKey(ignore: true)
  _$$_RunningCopyWith<_$_Running> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PausedCopyWith<$Res> {
  factory _$$_PausedCopyWith(_$_Paused value, $Res Function(_$_Paused) then) =
      __$$_PausedCopyWithImpl<$Res>;
  $Res call({IList<Loop> loops, int loopIndex, int set, int taskIndex});
}

/// @nodoc
class __$$_PausedCopyWithImpl<$Res> extends _$IntervalStateCopyWithImpl<$Res>
    implements _$$_PausedCopyWith<$Res> {
  __$$_PausedCopyWithImpl(_$_Paused _value, $Res Function(_$_Paused) _then)
      : super(_value, (v) => _then(v as _$_Paused));

  @override
  _$_Paused get _value => super._value as _$_Paused;

  @override
  $Res call({
    Object? loops = freezed,
    Object? loopIndex = freezed,
    Object? set = freezed,
    Object? taskIndex = freezed,
  }) {
    return _then(_$_Paused(
      loops == freezed
          ? _value.loops
          : loops // ignore: cast_nullable_to_non_nullable
              as IList<Loop>,
      loopIndex == freezed
          ? _value.loopIndex
          : loopIndex // ignore: cast_nullable_to_non_nullable
              as int,
      set == freezed
          ? _value.set
          : set // ignore: cast_nullable_to_non_nullable
              as int,
      taskIndex == freezed
          ? _value.taskIndex
          : taskIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Paused implements _Paused {
  const _$_Paused(this.loops, this.loopIndex, this.set, this.taskIndex);

  @override
  final IList<Loop> loops;
  @override
  final int loopIndex;
  @override
  final int set;
  @override
  final int taskIndex;

  @override
  String toString() {
    return 'IntervalState.paused(loops: $loops, loopIndex: $loopIndex, set: $set, taskIndex: $taskIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Paused &&
            const DeepCollectionEquality().equals(other.loops, loops) &&
            const DeepCollectionEquality().equals(other.loopIndex, loopIndex) &&
            const DeepCollectionEquality().equals(other.set, set) &&
            const DeepCollectionEquality().equals(other.taskIndex, taskIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loops),
      const DeepCollectionEquality().hash(loopIndex),
      const DeepCollectionEquality().hash(set),
      const DeepCollectionEquality().hash(taskIndex));

  @JsonKey(ignore: true)
  @override
  _$$_PausedCopyWith<_$_Paused> get copyWith =>
      __$$_PausedCopyWithImpl<_$_Paused>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            IList<Loop> loops, int loopIndex, int set, int taskIndex)
        running,
    required TResult Function(
            IList<Loop> loops, int loopIndex, int set, int taskIndex)
        paused,
    required TResult Function() finished,
  }) {
    return paused(loops, loopIndex, set, taskIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(IList<Loop> loops, int loopIndex, int set, int taskIndex)?
        running,
    TResult Function(IList<Loop> loops, int loopIndex, int set, int taskIndex)?
        paused,
    TResult Function()? finished,
  }) {
    return paused?.call(loops, loopIndex, set, taskIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(IList<Loop> loops, int loopIndex, int set, int taskIndex)?
        running,
    TResult Function(IList<Loop> loops, int loopIndex, int set, int taskIndex)?
        paused,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(loops, loopIndex, set, taskIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Running value) running,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Finished value) finished,
  }) {
    return paused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Running value)? running,
    TResult Function(_Paused value)? paused,
    TResult Function(_Finished value)? finished,
  }) {
    return paused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Running value)? running,
    TResult Function(_Paused value)? paused,
    TResult Function(_Finished value)? finished,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class _Paused implements IntervalState {
  const factory _Paused(final IList<Loop> loops, final int loopIndex,
      final int set, final int taskIndex) = _$_Paused;

  IList<Loop> get loops;
  int get loopIndex;
  int get set;
  int get taskIndex;
  @JsonKey(ignore: true)
  _$$_PausedCopyWith<_$_Paused> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FinishedCopyWith<$Res> {
  factory _$$_FinishedCopyWith(
          _$_Finished value, $Res Function(_$_Finished) then) =
      __$$_FinishedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FinishedCopyWithImpl<$Res> extends _$IntervalStateCopyWithImpl<$Res>
    implements _$$_FinishedCopyWith<$Res> {
  __$$_FinishedCopyWithImpl(
      _$_Finished _value, $Res Function(_$_Finished) _then)
      : super(_value, (v) => _then(v as _$_Finished));

  @override
  _$_Finished get _value => super._value as _$_Finished;
}

/// @nodoc

class _$_Finished implements _Finished {
  const _$_Finished();

  @override
  String toString() {
    return 'IntervalState.finished()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Finished);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            IList<Loop> loops, int loopIndex, int set, int taskIndex)
        running,
    required TResult Function(
            IList<Loop> loops, int loopIndex, int set, int taskIndex)
        paused,
    required TResult Function() finished,
  }) {
    return finished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(IList<Loop> loops, int loopIndex, int set, int taskIndex)?
        running,
    TResult Function(IList<Loop> loops, int loopIndex, int set, int taskIndex)?
        paused,
    TResult Function()? finished,
  }) {
    return finished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(IList<Loop> loops, int loopIndex, int set, int taskIndex)?
        running,
    TResult Function(IList<Loop> loops, int loopIndex, int set, int taskIndex)?
        paused,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Running value) running,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Finished value) finished,
  }) {
    return finished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Running value)? running,
    TResult Function(_Paused value)? paused,
    TResult Function(_Finished value)? finished,
  }) {
    return finished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Running value)? running,
    TResult Function(_Paused value)? paused,
    TResult Function(_Finished value)? finished,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class _Finished implements IntervalState {
  const factory _Finished() = _$_Finished;
}
