import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:interval/domain/entitites/loop.dart';
import 'package:interval/domain/entitites/task.dart';

import '../../../domain/entitites/length.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(work: Length(), rest: Length(), lap: 1));

  void setLap(int value) {
    emit(state.copy(lap: value));
  }

  void setWorkMinutes(int value) {
    emit(state.copy(work: state.work.copy(minutes: value)));
  }

  void setWorkSeconds(int value) {
    emit(state.copy(work: state.work.copy(seconds: value)));
  }

  void setRestMinutes(int value) {
    emit(state.copy(rest: state.rest.copy(minutes: value)));
  }

  void setRestSeconds(int value) {
    emit(state.copy(rest: state.rest.copy(seconds: value)));
  }
}
