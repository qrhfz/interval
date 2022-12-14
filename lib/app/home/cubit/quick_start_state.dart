import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interval/domain/entitites/loop.dart';
import 'package:interval/domain/entitites/preset.dart';

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
            Task(
                name: "Prepare",
                duration: const Duration(seconds: 3),
                color: Colors.blue),
          ]),
          sets: 1),
      Loop(
        tasks: IList([
          Task(
              name: "Work",
              duration: Duration(minutes: workMins, seconds: workSecs)),
          Task(
            name: "Rest",
            duration: Duration(minutes: restMins, seconds: restSecs),
            color: Colors.green,
          ),
        ]),
        sets: sets,
      )
    ]);
  }

  Preset get preset => Preset(name: "Quick Start", loops: toLoops());
}
