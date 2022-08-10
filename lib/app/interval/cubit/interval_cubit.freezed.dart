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
    required TResult Function(IntervalInitial value) initial,
    required TResult Function(IntervalRunning value) running,
    required TResult Function(IntervalPaused value) paused,
    required TResult Function(IntervalFinished value) finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IntervalInitial value)? initial,
    TResult Function(IntervalRunning value)? running,
    TResult Function(IntervalPaused value)? paused,
    TResult Function(IntervalFinished value)? finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IntervalInitial value)? initial,
    TResult Function(IntervalRunning value)? running,
    TResult Function(IntervalPaused value)? paused,
    TResult Function(IntervalFinished value)? finished,
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
abstract class _$$IntervalInitialCopyWith<$Res> {
  factory _$$IntervalInitialCopyWith(
          _$IntervalInitial value, $Res Function(_$IntervalInitial) then) =
      __$$IntervalInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IntervalInitialCopyWithImpl<$Res>
    extends _$IntervalStateCopyWithImpl<$Res>
    implements _$$IntervalInitialCopyWith<$Res> {
  __$$IntervalInitialCopyWithImpl(
      _$IntervalInitial _value, $Res Function(_$IntervalInitial) _then)
      : super(_value, (v) => _then(v as _$IntervalInitial));

  @override
  _$IntervalInitial get _value => super._value as _$IntervalInitial;
}

/// @nodoc

class _$IntervalInitial implements IntervalInitial {
  const _$IntervalInitial();

  @override
  String toString() {
    return 'IntervalState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IntervalInitial);
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
    required TResult Function(IntervalInitial value) initial,
    required TResult Function(IntervalRunning value) running,
    required TResult Function(IntervalPaused value) paused,
    required TResult Function(IntervalFinished value) finished,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IntervalInitial value)? initial,
    TResult Function(IntervalRunning value)? running,
    TResult Function(IntervalPaused value)? paused,
    TResult Function(IntervalFinished value)? finished,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IntervalInitial value)? initial,
    TResult Function(IntervalRunning value)? running,
    TResult Function(IntervalPaused value)? paused,
    TResult Function(IntervalFinished value)? finished,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class IntervalInitial implements IntervalState {
  const factory IntervalInitial() = _$IntervalInitial;
}

/// @nodoc
abstract class _$$IntervalRunningCopyWith<$Res> {
  factory _$$IntervalRunningCopyWith(
          _$IntervalRunning value, $Res Function(_$IntervalRunning) then) =
      __$$IntervalRunningCopyWithImpl<$Res>;
  $Res call({IList<Loop> loops, int loopIndex, int set, int taskIndex});
}

/// @nodoc
class __$$IntervalRunningCopyWithImpl<$Res>
    extends _$IntervalStateCopyWithImpl<$Res>
    implements _$$IntervalRunningCopyWith<$Res> {
  __$$IntervalRunningCopyWithImpl(
      _$IntervalRunning _value, $Res Function(_$IntervalRunning) _then)
      : super(_value, (v) => _then(v as _$IntervalRunning));

  @override
  _$IntervalRunning get _value => super._value as _$IntervalRunning;

  @override
  $Res call({
    Object? loops = freezed,
    Object? loopIndex = freezed,
    Object? set = freezed,
    Object? taskIndex = freezed,
  }) {
    return _then(_$IntervalRunning(
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

class _$IntervalRunning implements IntervalRunning {
  const _$IntervalRunning(this.loops, this.loopIndex, this.set, this.taskIndex);

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
            other is _$IntervalRunning &&
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
  _$$IntervalRunningCopyWith<_$IntervalRunning> get copyWith =>
      __$$IntervalRunningCopyWithImpl<_$IntervalRunning>(this, _$identity);

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
    required TResult Function(IntervalInitial value) initial,
    required TResult Function(IntervalRunning value) running,
    required TResult Function(IntervalPaused value) paused,
    required TResult Function(IntervalFinished value) finished,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IntervalInitial value)? initial,
    TResult Function(IntervalRunning value)? running,
    TResult Function(IntervalPaused value)? paused,
    TResult Function(IntervalFinished value)? finished,
  }) {
    return running?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IntervalInitial value)? initial,
    TResult Function(IntervalRunning value)? running,
    TResult Function(IntervalPaused value)? paused,
    TResult Function(IntervalFinished value)? finished,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(this);
    }
    return orElse();
  }
}

abstract class IntervalRunning implements IntervalState {
  const factory IntervalRunning(final IList<Loop> loops, final int loopIndex,
      final int set, final int taskIndex) = _$IntervalRunning;

  IList<Loop> get loops;
  int get loopIndex;
  int get set;
  int get taskIndex;
  @JsonKey(ignore: true)
  _$$IntervalRunningCopyWith<_$IntervalRunning> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IntervalPausedCopyWith<$Res> {
  factory _$$IntervalPausedCopyWith(
          _$IntervalPaused value, $Res Function(_$IntervalPaused) then) =
      __$$IntervalPausedCopyWithImpl<$Res>;
  $Res call({IList<Loop> loops, int loopIndex, int set, int taskIndex});
}

/// @nodoc
class __$$IntervalPausedCopyWithImpl<$Res>
    extends _$IntervalStateCopyWithImpl<$Res>
    implements _$$IntervalPausedCopyWith<$Res> {
  __$$IntervalPausedCopyWithImpl(
      _$IntervalPaused _value, $Res Function(_$IntervalPaused) _then)
      : super(_value, (v) => _then(v as _$IntervalPaused));

  @override
  _$IntervalPaused get _value => super._value as _$IntervalPaused;

  @override
  $Res call({
    Object? loops = freezed,
    Object? loopIndex = freezed,
    Object? set = freezed,
    Object? taskIndex = freezed,
  }) {
    return _then(_$IntervalPaused(
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

class _$IntervalPaused implements IntervalPaused {
  const _$IntervalPaused(this.loops, this.loopIndex, this.set, this.taskIndex);

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
            other is _$IntervalPaused &&
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
  _$$IntervalPausedCopyWith<_$IntervalPaused> get copyWith =>
      __$$IntervalPausedCopyWithImpl<_$IntervalPaused>(this, _$identity);

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
    required TResult Function(IntervalInitial value) initial,
    required TResult Function(IntervalRunning value) running,
    required TResult Function(IntervalPaused value) paused,
    required TResult Function(IntervalFinished value) finished,
  }) {
    return paused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IntervalInitial value)? initial,
    TResult Function(IntervalRunning value)? running,
    TResult Function(IntervalPaused value)? paused,
    TResult Function(IntervalFinished value)? finished,
  }) {
    return paused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IntervalInitial value)? initial,
    TResult Function(IntervalRunning value)? running,
    TResult Function(IntervalPaused value)? paused,
    TResult Function(IntervalFinished value)? finished,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class IntervalPaused implements IntervalState {
  const factory IntervalPaused(final IList<Loop> loops, final int loopIndex,
      final int set, final int taskIndex) = _$IntervalPaused;

  IList<Loop> get loops;
  int get loopIndex;
  int get set;
  int get taskIndex;
  @JsonKey(ignore: true)
  _$$IntervalPausedCopyWith<_$IntervalPaused> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IntervalFinishedCopyWith<$Res> {
  factory _$$IntervalFinishedCopyWith(
          _$IntervalFinished value, $Res Function(_$IntervalFinished) then) =
      __$$IntervalFinishedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IntervalFinishedCopyWithImpl<$Res>
    extends _$IntervalStateCopyWithImpl<$Res>
    implements _$$IntervalFinishedCopyWith<$Res> {
  __$$IntervalFinishedCopyWithImpl(
      _$IntervalFinished _value, $Res Function(_$IntervalFinished) _then)
      : super(_value, (v) => _then(v as _$IntervalFinished));

  @override
  _$IntervalFinished get _value => super._value as _$IntervalFinished;
}

/// @nodoc

class _$IntervalFinished implements IntervalFinished {
  const _$IntervalFinished();

  @override
  String toString() {
    return 'IntervalState.finished()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IntervalFinished);
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
    required TResult Function(IntervalInitial value) initial,
    required TResult Function(IntervalRunning value) running,
    required TResult Function(IntervalPaused value) paused,
    required TResult Function(IntervalFinished value) finished,
  }) {
    return finished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IntervalInitial value)? initial,
    TResult Function(IntervalRunning value)? running,
    TResult Function(IntervalPaused value)? paused,
    TResult Function(IntervalFinished value)? finished,
  }) {
    return finished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IntervalInitial value)? initial,
    TResult Function(IntervalRunning value)? running,
    TResult Function(IntervalPaused value)? paused,
    TResult Function(IntervalFinished value)? finished,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class IntervalFinished implements IntervalState {
  const factory IntervalFinished() = _$IntervalFinished;
}
