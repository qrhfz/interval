part of 'interval_cubit.dart';

@freezed
class IntervalState with _$IntervalState {
  const factory IntervalState.initial() = IntervalInitial;
  const factory IntervalState.running(
    IList<Loop> loops,
    int loopIndex,
    int set,
    int taskIndex,
  ) = IntervalRunning;
  const factory IntervalState.paused(
    IList<Loop> loops,
    int loopIndex,
    int set,
    int taskIndex,
  ) = IntervalPaused;
  const factory IntervalState.finished() = IntervalFinished;
}

extension IntervalRunningExtension on IntervalRunning {
  Task get currentTask => _getCurrentTask(loops, loopIndex, set, taskIndex);
}

extension IntervalPausedExtension on IntervalPaused {
  Task get currentTask => _getCurrentTask(loops, loopIndex, set, taskIndex);
}

Task _getCurrentTask(IList<Loop> loops, int loopIndex, int set, int taskIndex) {
  try {
    return loops[loopIndex].tasks[taskIndex];
  } on RangeError catch (_) {
    return Task(name: "error", duration: Duration.zero);
  }
}
