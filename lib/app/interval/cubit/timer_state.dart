part of 'timer_cubit.dart';

@freezed
class TimerState with _$TimerState {
  const factory TimerState.initial() = _Initial;
  const factory TimerState.running(Length timeleft) = _Running;
  const factory TimerState.paused(Length timeleft) = _Paused;
  const factory TimerState.finished() = _Finished;
}
