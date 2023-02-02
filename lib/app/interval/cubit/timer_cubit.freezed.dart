// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timer_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TimerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Task task, Duration timeleft) running,
    required TResult Function(Task task, Duration timeleft) paused,
    required TResult Function() finished,
    required TResult Function() quit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Task task, Duration timeleft)? running,
    TResult? Function(Task task, Duration timeleft)? paused,
    TResult? Function()? finished,
    TResult? Function()? quit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Task task, Duration timeleft)? running,
    TResult Function(Task task, Duration timeleft)? paused,
    TResult Function()? finished,
    TResult Function()? quit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Running value) running,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Finished value) finished,
    required TResult Function(_Quit value) quit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Running value)? running,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Finished value)? finished,
    TResult? Function(_Quit value)? quit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Running value)? running,
    TResult Function(_Paused value)? paused,
    TResult Function(_Finished value)? finished,
    TResult Function(_Quit value)? quit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res, TimerState>;
}

/// @nodoc
class _$TimerStateCopyWithImpl<$Res, $Val extends TimerState>
    implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'TimerState.initial()';
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
    required TResult Function(Task task, Duration timeleft) running,
    required TResult Function(Task task, Duration timeleft) paused,
    required TResult Function() finished,
    required TResult Function() quit,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Task task, Duration timeleft)? running,
    TResult? Function(Task task, Duration timeleft)? paused,
    TResult? Function()? finished,
    TResult? Function()? quit,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Task task, Duration timeleft)? running,
    TResult Function(Task task, Duration timeleft)? paused,
    TResult Function()? finished,
    TResult Function()? quit,
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
    required TResult Function(_Quit value) quit,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Running value)? running,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Finished value)? finished,
    TResult? Function(_Quit value)? quit,
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
    TResult Function(_Quit value)? quit,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TimerState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_RunningCopyWith<$Res> {
  factory _$$_RunningCopyWith(
          _$_Running value, $Res Function(_$_Running) then) =
      __$$_RunningCopyWithImpl<$Res>;
  @useResult
  $Res call({Task task, Duration timeleft});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$_RunningCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$_Running>
    implements _$$_RunningCopyWith<$Res> {
  __$$_RunningCopyWithImpl(_$_Running _value, $Res Function(_$_Running) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
    Object? timeleft = null,
  }) {
    return _then(_$_Running(
      null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      null == timeleft
          ? _value.timeleft
          : timeleft // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$_Running implements _Running {
  const _$_Running(this.task, this.timeleft);

  @override
  final Task task;
  @override
  final Duration timeleft;

  @override
  String toString() {
    return 'TimerState.running(task: $task, timeleft: $timeleft)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Running &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.timeleft, timeleft) ||
                other.timeleft == timeleft));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task, timeleft);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RunningCopyWith<_$_Running> get copyWith =>
      __$$_RunningCopyWithImpl<_$_Running>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Task task, Duration timeleft) running,
    required TResult Function(Task task, Duration timeleft) paused,
    required TResult Function() finished,
    required TResult Function() quit,
  }) {
    return running(task, timeleft);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Task task, Duration timeleft)? running,
    TResult? Function(Task task, Duration timeleft)? paused,
    TResult? Function()? finished,
    TResult? Function()? quit,
  }) {
    return running?.call(task, timeleft);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Task task, Duration timeleft)? running,
    TResult Function(Task task, Duration timeleft)? paused,
    TResult Function()? finished,
    TResult Function()? quit,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(task, timeleft);
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
    required TResult Function(_Quit value) quit,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Running value)? running,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Finished value)? finished,
    TResult? Function(_Quit value)? quit,
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
    TResult Function(_Quit value)? quit,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(this);
    }
    return orElse();
  }
}

abstract class _Running implements TimerState {
  const factory _Running(final Task task, final Duration timeleft) = _$_Running;

  Task get task;
  Duration get timeleft;
  @JsonKey(ignore: true)
  _$$_RunningCopyWith<_$_Running> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PausedCopyWith<$Res> {
  factory _$$_PausedCopyWith(_$_Paused value, $Res Function(_$_Paused) then) =
      __$$_PausedCopyWithImpl<$Res>;
  @useResult
  $Res call({Task task, Duration timeleft});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$_PausedCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$_Paused>
    implements _$$_PausedCopyWith<$Res> {
  __$$_PausedCopyWithImpl(_$_Paused _value, $Res Function(_$_Paused) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
    Object? timeleft = null,
  }) {
    return _then(_$_Paused(
      null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      null == timeleft
          ? _value.timeleft
          : timeleft // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$_Paused implements _Paused {
  const _$_Paused(this.task, this.timeleft);

  @override
  final Task task;
  @override
  final Duration timeleft;

  @override
  String toString() {
    return 'TimerState.paused(task: $task, timeleft: $timeleft)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Paused &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.timeleft, timeleft) ||
                other.timeleft == timeleft));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task, timeleft);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PausedCopyWith<_$_Paused> get copyWith =>
      __$$_PausedCopyWithImpl<_$_Paused>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Task task, Duration timeleft) running,
    required TResult Function(Task task, Duration timeleft) paused,
    required TResult Function() finished,
    required TResult Function() quit,
  }) {
    return paused(task, timeleft);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Task task, Duration timeleft)? running,
    TResult? Function(Task task, Duration timeleft)? paused,
    TResult? Function()? finished,
    TResult? Function()? quit,
  }) {
    return paused?.call(task, timeleft);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Task task, Duration timeleft)? running,
    TResult Function(Task task, Duration timeleft)? paused,
    TResult Function()? finished,
    TResult Function()? quit,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(task, timeleft);
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
    required TResult Function(_Quit value) quit,
  }) {
    return paused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Running value)? running,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Finished value)? finished,
    TResult? Function(_Quit value)? quit,
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
    TResult Function(_Quit value)? quit,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class _Paused implements TimerState {
  const factory _Paused(final Task task, final Duration timeleft) = _$_Paused;

  Task get task;
  Duration get timeleft;
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
class __$$_FinishedCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$_Finished>
    implements _$$_FinishedCopyWith<$Res> {
  __$$_FinishedCopyWithImpl(
      _$_Finished _value, $Res Function(_$_Finished) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Finished implements _Finished {
  const _$_Finished();

  @override
  String toString() {
    return 'TimerState.finished()';
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
    required TResult Function(Task task, Duration timeleft) running,
    required TResult Function(Task task, Duration timeleft) paused,
    required TResult Function() finished,
    required TResult Function() quit,
  }) {
    return finished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Task task, Duration timeleft)? running,
    TResult? Function(Task task, Duration timeleft)? paused,
    TResult? Function()? finished,
    TResult? Function()? quit,
  }) {
    return finished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Task task, Duration timeleft)? running,
    TResult Function(Task task, Duration timeleft)? paused,
    TResult Function()? finished,
    TResult Function()? quit,
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
    required TResult Function(_Quit value) quit,
  }) {
    return finished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Running value)? running,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Finished value)? finished,
    TResult? Function(_Quit value)? quit,
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
    TResult Function(_Quit value)? quit,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class _Finished implements TimerState {
  const factory _Finished() = _$_Finished;
}

/// @nodoc
abstract class _$$_QuitCopyWith<$Res> {
  factory _$$_QuitCopyWith(_$_Quit value, $Res Function(_$_Quit) then) =
      __$$_QuitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_QuitCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$_Quit>
    implements _$$_QuitCopyWith<$Res> {
  __$$_QuitCopyWithImpl(_$_Quit _value, $Res Function(_$_Quit) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Quit implements _Quit {
  const _$_Quit();

  @override
  String toString() {
    return 'TimerState.quit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Quit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Task task, Duration timeleft) running,
    required TResult Function(Task task, Duration timeleft) paused,
    required TResult Function() finished,
    required TResult Function() quit,
  }) {
    return quit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Task task, Duration timeleft)? running,
    TResult? Function(Task task, Duration timeleft)? paused,
    TResult? Function()? finished,
    TResult? Function()? quit,
  }) {
    return quit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Task task, Duration timeleft)? running,
    TResult Function(Task task, Duration timeleft)? paused,
    TResult Function()? finished,
    TResult Function()? quit,
    required TResult orElse(),
  }) {
    if (quit != null) {
      return quit();
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
    required TResult Function(_Quit value) quit,
  }) {
    return quit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Running value)? running,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Finished value)? finished,
    TResult? Function(_Quit value)? quit,
  }) {
    return quit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Running value)? running,
    TResult Function(_Paused value)? paused,
    TResult Function(_Finished value)? finished,
    TResult Function(_Quit value)? quit,
    required TResult orElse(),
  }) {
    if (quit != null) {
      return quit(this);
    }
    return orElse();
  }
}

abstract class _Quit implements TimerState {
  const factory _Quit() = _$_Quit;
}
