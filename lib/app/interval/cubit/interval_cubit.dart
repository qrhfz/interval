import 'package:bloc/bloc.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entitites/loop.dart';

part 'interval_state.dart';
part 'interval_cubit.freezed.dart';

class IntervalCubit extends Cubit<IntervalState> {
  IntervalCubit() : super(const IntervalState.initial());

  void start(IList<Loop> loops) {
    emit(IntervalState.running(loops, 0, 1, 0));
  }

  void next() {
    emit(state.maybeWhen(
      running: (loops, loopIndex, set, taskIndex) {
        final currentLoop = loops[loopIndex];
        if (taskIndex < currentLoop.tasks.length - 1) {
          taskIndex++;

          if (set < currentLoop.sets) {
            set++;
            if (loopIndex < loops.length - 1) {
              loopIndex++;
            }
          } else {
            set = 0;
          }
        } else {
          taskIndex = 0;
          if (set < currentLoop.sets) {
            set++;
            if (loopIndex < loops.length - 1) {
              loopIndex++;
            } else {
              return const IntervalState.finished();
            }
          } else {
            set = 0;
          }
        }
        return IntervalState.running(loops, loopIndex, set, taskIndex);
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
