import 'package:bloc/bloc.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interval/data/preset_repo.dart';
import 'package:interval/di.dart';
import 'package:interval/domain/entitites/preset.dart';

import '../../../domain/entitites/loop.dart';
import '../../../domain/entitites/task.dart';

part 'editor_state.dart';
part 'editor_cubit.freezed.dart';

class EditorCubit extends Cubit<EditorState> {
  EditorCubit() : super(const EditorState.initial());

  final repo = getIt.get<PresetRepo>();

  void init(int? presetKey, Preset preset) {
    emit(
      EditorState.data(
        presetKey,
        preset,
      ),
    );
  }

  void save() async {
    final newState = await state.when(
      initial: () async => state,
      data: (key, value) async {
        final respondKey = await repo.putPreset(key, value);
        return EditorState.data(respondKey, value);
      },
    );

    emit(newState);
  }

  void moveTask(int loopIndex, int oldIndex, int newIndex) {
    emit(state.map(
      initial: (state) => state,
      data: (data) {
        final loops = data.preset.loops.toList();
        final loop = loops[loopIndex];
        final tasks = loop.tasks.toList();
        final task = tasks.removeAt(oldIndex);

        if (newIndex >= tasks.length) {
          tasks.add(task);
        } else {
          tasks.insert(newIndex, task);
        }

        loops[loopIndex] = loop.copyWith(tasks: tasks.toIList());

        return data.copyWith(
            preset: data.preset.copyWith(loops: loops.toIList()));
      },
    ));
  }

  void moveLoopUp(int loopIndex) {
    if (loopIndex == 0) return;
    emit(state.map(
      initial: (state) => state,
      data: (data) {
        final loops = data.preset.loops.toList();
        final loop = loops.removeAt(loopIndex);
        loops.insert(loopIndex - 1, loop);

        return data.copyWith(
            preset: data.preset.copyWith(loops: loops.toIList()));
      },
    ));
  }

  void moveLoopDown(int loopIndex) {
    emit(state.map(
      initial: (state) => state,
      data: (data) {
        if (loopIndex == data.preset.loops.length - 1) return data;
        final loops = data.preset.loops.toList();
        final loop = loops.removeAt(loopIndex);
        loops.insert(loopIndex + 1, loop);

        return data.copyWith(
            preset: data.preset.copyWith(loops: loops.toIList()));
      },
    ));
  }

  void updatePresetName(String text) {
    emit(state.map(
      initial: (state) => state,
      data: (data) {
        return data.copyWith(
          preset: data.preset.copyWith(name: text),
        );
      },
    ));
  }

  void addLoop() {
    emit(state.map(
      initial: (state) => state,
      data: (data) {
        final loops = data.preset.loops.add(Loop(tasks: IList(), sets: 1));
        return data.copyWith(
          preset: data.preset.copyWith(loops: loops),
        );
      },
    ));
  }

  void removeLoop(Loop loop) {
    emit(state.map(
      initial: (state) => state,
      data: (data) {
        final loops = data.preset.loops.remove(loop);
        return data.copyWith(
          preset: data.preset.copyWith(loops: loops),
        );
      },
    ));
  }

  void updateSetCount(int loopIndex, int count) {
    emit(state.map(
      initial: (state) => state,
      data: (data) {
        final loops = data.preset.loops.toList();
        loops[loopIndex] = loops[loopIndex].copyWith(sets: count);
        return data.copyWith(
          preset: data.preset.copyWith(loops: loops.toIList()),
        );
      },
    ));
  }

  void addTaskToLoop(int loopIndex, Task task) {
    emit(state.map(
      initial: (state) => state,
      data: (data) {
        final loops = data.preset.loops.toList();
        final loop = loops[loopIndex];
        loops[loopIndex] = loop.copyWith(tasks: loop.tasks.add(task));
        return data.copyWith(
          preset: data.preset.copyWith(loops: loops.toIList()),
        );
      },
    ));
  }

  void updateTask(int loopIndex, int taskIndex, Task task) {
    emit(state.map(
      initial: (state) => state,
      data: (data) {
        final loops = data.preset.loops.toList();
        final loop = loops[loopIndex];
        final tasks = loop.tasks.toList();
        tasks[taskIndex] = task;
        loops[loopIndex] = loop.copyWith(tasks: tasks.toIList());
        return data.copyWith(
          preset: data.preset.copyWith(loops: loops.toIList()),
        );
      },
    ));
  }

  void removeTask(int loopIndex, int taskIndex) {
    emit(state.map(
      initial: (state) => state,
      data: (data) {
        final loops = data.preset.loops.toList();
        final loop = loops[loopIndex];
        final tasks = loop.tasks.removeAt(taskIndex);

        loops[loopIndex] = loop.copyWith(tasks: tasks);
        return data.copyWith(
          preset: data.preset.copyWith(loops: loops.toIList()),
        );
      },
    ));
  }
}
