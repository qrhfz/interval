part of 'interval_cubit.dart';

@freezed
class IntervalState with _$IntervalState {
  const factory IntervalState.initial() = _Initial;
  const factory IntervalState.running(
    IList<Loop> loops,
    int loopIndex,
    int set,
    int taskIndex,
  ) = _Running;
  const factory IntervalState.paused(
    IList<Loop> loops,
    int loopIndex,
    int set,
    int taskIndex,
  ) = _Paused;
  const factory IntervalState.finished() = _Finished;
}
