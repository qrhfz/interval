import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interval/domain/entitites/length.dart';

part 'timer_state.dart';
part 'timer_cubit.freezed.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(const TimerState.initial());

  Timer? timer;

  void start(Length length) {
    timer?.cancel();
    emit(TimerState.running(length));
    if (length.inSeconds <= Length.zero.inSeconds) {
      Future.microtask(() {
        emit(const TimerState.finished());
      });
      return;
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      length = length.decrementSecond();
      emit(TimerState.running(length));

      if (length.inSeconds <= Length.zero.inSeconds) {
        timer.cancel();
        this.timer = null;
        emit(const TimerState.finished());
      }
    });
  }

  void pause() {
    state.maybeWhen(
      running: (timeleft) {
        timer?.cancel();
        timer = null;
        emit(TimerState.paused(timeleft));
      },
      paused: (timeleft) {
        start(timeleft);
      },
      orElse: () => emit(state),
    );
  }

  void stop() {
    timer?.cancel();
    emit(const TimerState.finished());
  }

  @override
  Future<void> close() {
    timer?.cancel();
    timer = null;
    return super.close();
  }
}
