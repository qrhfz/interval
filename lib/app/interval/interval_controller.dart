import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:interval/domain/entitites/loop.dart';
import 'package:interval/domain/entitites/preset.dart';

import '../../domain/entitites/task.dart';

class IntervalController {
  final Preset preset;
  late final _state = ValueNotifier<IntervalState>(
    Running(
      controller: this,
      set: 1,
      loopPos: 0,
      taskPos: 0,
    ),
  );

  IntervalController(this.preset);

  void pause() {
    _state.value.pause();
  }

  void stop() {
    _state.value.stop();
  }

  void next() {
    _state.value.next();
  }

  void prev() {}

  ValueListenable<IntervalState> get state => _state;
  void setState(IntervalState state) {
    _state.value = state;
  }
}

sealed class IntervalState {
  final IntervalController controller;

  IntervalState({required this.controller});

  void next();

  void pause();

  void stop();
}

class Running extends IntervalState with _Active {
  final int set;
  @override
  final int loopPos;
  @override
  final int taskPos;
  late final ValueNotifier<Duration> _durationRemaning;
  ValueListenable<Duration> get durationRemaning => _durationRemaning;
  Timer? timer;

  Running({
    required this.set,
    required this.loopPos,
    required this.taskPos,
    required super.controller,
    Duration? durationRemaning,
  }) {
    final firstTask = controller.preset.loops.first.tasks.first;

    _durationRemaning = ValueNotifier(
        durationRemaning ?? Duration(seconds: firstTask.duration.inSeconds));

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _durationRemaning.value -= const Duration(seconds: 1);
      log("${_durationRemaning.value}");
      if (_durationRemaning.value == Duration.zero) {
        next();
      }
    });
  }

  @override
  void next() {
    _next();
    dispose();
  }

  @override
  void pause() {
    controller.setState(Paused(
      controller: controller,
      loopPos: loopPos,
      set: set,
      taskPos: taskPos + 1,
      durationRemaning: _durationRemaning.value,
    ));
    dispose();
  }

  @override
  void stop() {
    controller.setState(Finished(controller: controller));
    dispose();
  }

  dispose() {
    _durationRemaning.dispose();
    timer?.cancel();
    timer = null;
  }

  Duration get timeRemaning => _durationRemaning.value;
}

mixin _Active {
  IntervalController get controller;
  int get loopPos;
  int get taskPos;
  int get set;

  Loop get currentLoop => controller.preset.loops[loopPos];
  Task get currentTask => currentLoop.tasks[taskPos];

  void _next() {
    final isLastLoop = loopPos == controller.preset.loops.length - 1;
    final isLastSet = set == currentLoop.sets;
    final isLastTask = taskPos == currentLoop.tasks.length - 1;

    if (isLastTask && isLastSet && isLastLoop) {
      controller.setState(Finished(controller: controller));
    } else if (isLastTask && isLastSet) {
      controller.setState(Running(
        controller: controller,
        loopPos: loopPos + 1,
        set: 0,
        taskPos: 0,
      ));
    } else if (isLastTask) {
      controller.setState(Running(
        controller: controller,
        loopPos: loopPos,
        set: set + 1,
        taskPos: 0,
      ));
    } else {
      controller.setState(Running(
        controller: controller,
        loopPos: loopPos,
        set: set,
        taskPos: taskPos + 1,
      ));
    }
  }
}

class Paused extends IntervalState with _Active {
  final int set;
  @override
  final int loopPos;
  @override
  final int taskPos;
  final Duration durationRemaning;

  Paused({
    required this.loopPos,
    required this.set,
    required this.taskPos,
    required this.durationRemaning,
    required super.controller,
  });

  @override
  void next() {
    _next();
  }

  @override
  void pause() {
    controller.setState(Running(
      controller: controller,
      loopPos: loopPos,
      set: set,
      taskPos: taskPos,
      durationRemaning: durationRemaning,
    ));
  }

  Task get currentTask => controller.preset.loops[loopPos].tasks[taskPos];

  @override
  void stop() {
    controller.setState(Finished(controller: controller));
  }
}

class Finished extends IntervalState {
  Finished({required super.controller});

  @override
  void next() {}

  @override
  void pause() {}

  @override
  void stop() {}
}

mixin _ActiveState {}

class TransformListenable<T, R> extends ValueNotifier<R> {
  final ValueNotifier<T> upstream;
  final R Function(T data) transformer;

  TransformListenable(this.upstream, this.transformer)
      : super(transformer(upstream.value)) {
    upstream.addListener(notifyListeners);
  }

  @override
  get value => transformer(upstream.value);

  @override
  void dispose() {
    upstream.removeListener(notifyListeners);
    super.dispose();
  }
}
