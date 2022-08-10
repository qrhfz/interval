import 'package:bloc/bloc.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entitites/loop.dart';
import '../../../domain/entitites/task.dart';

part 'interval_state.dart';
part 'interval_cubit.freezed.dart';

class IntervalCubit extends Cubit<IntervalState> {
  IntervalCubit() : super(const IntervalState.initial());

  void start(IList<Loop> loops) {
    if (loops.isEmpty) {
      emit(const IntervalState.finished());
      return;
    }
    int startIndex = -1;
    for (var i = 0; i < loops.length; i++) {
      if (loops[i].tasks.isEmpty) {
        continue;
      } else {
        startIndex = i;
        break;
      }
    }

    if (startIndex == -1) {
      return;
    }

    emit(IntervalState.running(loops, startIndex, 0, 0));
  }

  void next() {
    emit(state.maybeWhen(
      running: (loops, loopIndex, set, taskIndex) {
        final currentLoop = loops[loopIndex];
        final isLastTask = taskIndex == currentLoop.tasks.length - 1;
        final isLastSet = set == currentLoop.sets - 1;
        final isLastLoop = loopIndex == loops.length - 1;

        if (isLastTask && isLastSet && isLastLoop) {
          return const IntervalState.finished();
        } else if (isLastTask && isLastSet) {
          return IntervalState.running(loops, loopIndex + 1, 0, 0);
        } else if (isLastTask) {
          return IntervalState.running(loops, loopIndex, set + 1, 0);
        } else {
          return IntervalState.running(loops, loopIndex, set, taskIndex + 1);
        }
      },
      orElse: () => state,
    ));
  }

  void pause() {
    emit(state.maybeWhen(
      running: (loops, loopIndex, set, taskIndex) {
        return IntervalState.paused(loops, loopIndex, set, taskIndex);
      },
      paused: (loops, loopIndex, set, taskIndex) {
        return IntervalState.running(loops, loopIndex, set, taskIndex);
      },
      orElse: () => state,
    ));
  }

  void stop() {
    emit(const IntervalState.finished());
  }
}
