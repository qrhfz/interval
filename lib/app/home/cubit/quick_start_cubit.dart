import 'package:bloc/bloc.dart';
import 'quick_start_state.dart';

class QuickStartCubit extends Cubit<QuickStartState> {
  QuickStartCubit()
      : super(QuickStartState(
          workMins: 1,
          restSecs: 30,
          sets: 3,
        ));

  void setLap(int value) {
    emit(state.copyWith(sets: value));
  }

  void setWorkMinutes(int value) {
    emit(state.copyWith(workMins: value));
  }

  void setWorkSeconds(int value) {
    emit(state.copyWith(workSecs: value));
  }

  void setRestMinutes(int value) {
    emit(state.copyWith(restMins: value));
  }

  void setRestSeconds(int value) {
    emit(state.copyWith(restSecs: value));
  }
}
