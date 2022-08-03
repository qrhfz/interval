import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interval/domain/entitites/length.dart';
import 'package:interval/domain/entitites/loop.dart';

import '../../../domain/entitites/task.dart';

part 'quick_start_state.freezed.dart';

@freezed
class QuickStartState with _$QuickStartState {
  QuickStartState._();

  factory QuickStartState({
    @Default(0) int workMins,
    @Default(0) int workSecs,
    @Default(0) int restMins,
    @Default(0) int restSecs,
    @Default(0) int sets,
  }) = _QuickStartState;

  IList<Loop> toLoops() {
    return IList([
      Loop(
        tasks: IList([
          Task("Prepare", const Length(seconds: 3)),
          Task("Work", Length(minutes: workMins, seconds: workSecs)),
          Task("Rest", Length(minutes: restMins, seconds: restSecs)),
        ]),
        sets: sets,
      )
    ]);
  }
}
