import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entitites/task.dart';

part 'timer_state.dart';
part 'timer_cubit.freezed.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(const TimerState.initial());

  Timer? timer;

  void start(Task task) {
    Duration duration = task.duration;
    timer?.cancel();
    emit(TimerState.running(task, duration));
    if (duration.inSeconds <= 0) {
      Future.microtask(() {
        emit(const TimerState.finished());
      });
      return;
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      duration = duration - const Duration(seconds: 1);
      emit(TimerState.running(task, duration));

      if (duration.inSeconds <= 0) {
        timer.cancel();
        this.timer = null;
        emit(const TimerState.finished());
      }
    });
  }

  void pause() {
    state.maybeWhen(
      running: (task, timeleft) {
        timer?.cancel();
        timer = null;
        emit(TimerState.paused(task, timeleft));
      },
      paused: (task, timeleft) {
        start(task);
      },
      orElse: () => emit(state),
    );
  }

  void stop() {
    emit(const TimerState.finished());
    timer?.cancel();
    timer = null;
  }

  void quit() {
    emit(const TimerState.quit());
    timer?.cancel();
    timer = null;
  }

  @override
  Future<void> close() {
    timer?.cancel();
    timer = null;
    return super.close();
  }
}
