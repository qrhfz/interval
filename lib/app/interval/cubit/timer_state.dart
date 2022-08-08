part of 'timer_cubit.dart';

@freezed
class TimerState with _$TimerState {
  const factory TimerState.initial() = _Initial;
  const factory TimerState.running(Task task, Duration timeleft) = _Running;
  const factory TimerState.paused(Task task, Duration timeleft) = _Paused;
  const factory TimerState.finished() = _Finished;
}
