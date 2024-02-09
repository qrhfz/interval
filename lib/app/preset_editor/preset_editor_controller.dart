import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:interval/domain/entitites/loop.dart';
import 'package:interval/domain/entitites/task.dart';

import '../../data/preset_repo.dart';
import '../../di.dart';
import '../../domain/entitites/preset.dart';

typedef EditorData = ({int? key, Preset preset});

class PresetEditorController {
  late final ValueNotifier<EditorData> _state;
  ValueListenable<EditorData> get state => _state;
  final repo = getIt<PresetRepo>();

  final _samplePreset = Preset(
    name: 'My Preset',
    loops: IList([
      Loop(
        tasks: IList([
          Task(
            name: "Work",
            duration: const Duration(minutes: 10),
            color: Colors.red,
          ),
          Task(
            name: "Rest",
            duration: const Duration(minutes: 5),
            color: Colors.blue,
          ),
        ]),
        sets: 1,
      ),
    ]),
  );

  PresetEditorController({int? key}) {
    Preset? preset;
    if (key != null) {
      preset = repo.getPreset(key);
    }
    _state = ValueNotifier((key: key, preset: preset ?? _samplePreset));

    // for autosave
    _state.addListener(() {
      // don't save if new preset hasn't been saved
      if (_state.value.key == null) {
        return;
      }
      save();
    });
  }

  void save() async {
    final state = _state.value;
    final newKey = await repo.putPreset(state.key, state.preset);

    _state.value = (key: newKey, preset: state.preset);
  }

  void moveTask(int loopIndex, int oldIndex, int newIndex) {
    final data = _state.value;
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

    _state.value = (
      preset: data.preset.copyWith(loops: loops.toIList()),
      key: data.key,
    );
  }

  void moveLoopUp(int loopIndex) {
    if (loopIndex == 0) return;

    final data = _state.value;

    final loops = data.preset.loops.toList();
    final loop = loops.removeAt(loopIndex);
    loops.insert(loopIndex - 1, loop);
    _updatePreset(data.preset.copyWith(loops: loops.toIList()));
  }

  void moveLoopDown(int loopIndex) {
    final data = _state.value;
    if (loopIndex == data.preset.loops.length - 1) return;
    final loops = data.preset.loops.toList();
    final loop = loops.removeAt(loopIndex);
    loops.insert(loopIndex + 1, loop);

    _updatePreset(data.preset.copyWith(loops: loops.toIList()));
  }

  void updatePresetName(String text) {
    final data = _state.value;
    _updatePreset(data.preset.copyWith(name: text));
  }

  void addLoop() {
    final data = _state.value;

    final loops = data.preset.loops.add(Loop(tasks: IList(), sets: 1));

    _updatePreset(data.preset.copyWith(loops: loops));
  }

  void removeLoop(Loop loop) {
    final data = _state.value;
    final loops = data.preset.loops.remove(loop);

    _updatePreset(data.preset.copyWith(loops: loops));
  }

  void updateSetCount(int loopIndex, int count) {
    final data = _state.value;
    final loops = data.preset.loops.toList();
    loops[loopIndex] = loops[loopIndex].copyWith(sets: count);
    _updatePreset(data.preset.copyWith(loops: loops.toIList()));
  }

  void addTaskToLoop(int loopIndex, Task task) {
    final data = _state.value;

    final loops = data.preset.loops.toList();
    final loop = loops[loopIndex];

    loops[loopIndex] = loop.copyWith(tasks: loop.tasks.add(task));
    _updatePreset(data.preset.copyWith(loops: loops.toIList()));
  }

  void updateTask(int loopIndex, int taskIndex, Task task) {
    final data = _state.value;

    final loops = data.preset.loops.toList();
    final loop = loops[loopIndex];
    final tasks = loop.tasks.toList();

    tasks[taskIndex] = task;

    loops[loopIndex] = loop.copyWith(tasks: tasks.toIList());
    _updatePreset(data.preset.copyWith(loops: loops.toIList()));
  }

  void removeTask(int loopIndex, int taskIndex) {
    final data = _state.value;

    final loops = data.preset.loops.toList();
    final loop = loops[loopIndex];
    final tasks = loop.tasks.removeAt(taskIndex);

    loops[loopIndex] = loop.copyWith(tasks: tasks);

    _updatePreset(data.preset.copyWith(loops: loops.toIList()));
  }

  void _updatePreset(Preset p) {
    _state.value = (key: _state.value.key, preset: p);
  }
}
