import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:interval/app/interval/notification_manager.dart';
import 'package:interval/app/interval/timer_auido_controller.dart';
import 'package:interval/di.dart';
import 'package:interval/utils/duration_extension.dart';

import '../../domain/entitites/loop.dart';
import '../../domain/entitites/preset.dart';
import '../../domain/entitites/task.dart';

class IntervalController {
  final Preset preset;
  final TimerAudioController _audio = getIt();
  late final NotificationManager _notification;

  late final _state = ValueNotifier<IntervalState>(
    Running(
      controller: this,
      set: 1,
      loopPos: 0,
      taskPos: 0,
    ),
  );

  IntervalController(this.preset) {
    _notification = NotificationManager(
      onPaused: () => pause(),
      onStopped: () => stop(),
    );
    updateNotification();
  }

  void restart() {
    _state.value = Running(
      controller: this,
      set: 1,
      loopPos: 0,
      taskPos: 0,
    );
  }

  void pause() {
    _state.value.pause();
  }

  void stop() {
    _state.value.stop();
  }

  void next() {
    _audio.playSetDoneSound();
    final oldState = _state.value;
    oldState.next();
  }

  void dispose() {
    _state.value.dispose();
    _notification.dismissTimer();
  }

  void setState(IntervalState state) {
    _state.value.dispose();
    _state.value = state;
    updateNotification();
  }

  void updateNotification() {
    final state = _state.value;
    switch (state) {
      case Running():
        state.durationRemaning.addListener(() {
          final taskName = state.currentTask.name;
          final duration = state.timeRemaning.toHHMMSS();
          _notification.showTimer(taskName, duration, false);
        });
        break;
      case Paused():
        final taskName = state.currentTask.name;
        final duration = state.durationRemaning.toHHMMSS();
        _notification.showTimer(taskName, duration, true);
      default:
    }
  }

  ValueListenable<IntervalState> get state => _state;
}

sealed class IntervalState {
  // ignore: unused_field
  final IntervalController _controller;

  IntervalState({required IntervalController controller})
      : _controller = controller;

  void next();

  void pause();

  void stop();

  void dispose();
}

class Running extends IntervalState with _Active {
  @override
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
    final task = currentTask;

    _durationRemaning = ValueNotifier(durationRemaning ?? task.duration);

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _durationRemaning.value -= const Duration(seconds: 1);
        log("${_durationRemaning.value}");
        if (_durationRemaning.value == Duration.zero) {
          _controller.next();
        }
      },
    );
  }

  @override
  void next() {
    _next();
  }

  @override
  void pause() {
    _controller.setState(Paused(
      controller: _controller,
      loopPos: loopPos,
      set: set,
      taskPos: taskPos,
      durationRemaning: _durationRemaning.value,
    ));
  }

  @override
  void stop() {
    _controller.setState(Finished(controller: _controller));
  }

  @override
  void dispose() {
    _durationRemaning.dispose();
    timer?.cancel();
    timer = null;
  }

  Duration get timeRemaning => _durationRemaning.value;
}

mixin _Active {
  IntervalController get _controller;
  int get loopPos;
  int get taskPos;
  int get set;

  Loop get currentLoop => _controller.preset.loops[loopPos];
  Task get currentTask => currentLoop.tasks[taskPos];

  void _next() {
    final isLastLoop = loopPos == _controller.preset.loops.length - 1;
    final isLastSet = set == currentLoop.sets;
    final isLastTask = taskPos == currentLoop.tasks.length - 1;

    if (isLastTask && isLastSet && isLastLoop) {
      _controller.setState(Finished(controller: _controller));
    } else if (isLastTask && isLastSet) {
      _controller.setState(Running(
        controller: _controller,
        loopPos: loopPos + 1,
        set: 0,
        taskPos: 0,
      ));
    } else if (isLastTask) {
      _controller.setState(Running(
        controller: _controller,
        loopPos: loopPos,
        set: set + 1,
        taskPos: 0,
      ));
    } else {
      _controller.setState(Running(
        controller: _controller,
        loopPos: loopPos,
        set: set,
        taskPos: taskPos + 1,
      ));
    }
  }
}

class Paused extends IntervalState with _Active {
  @override
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
    _controller.setState(Running(
      controller: _controller,
      loopPos: loopPos,
      set: set,
      taskPos: taskPos,
      durationRemaning: durationRemaning,
    ));
  }

  @override
  void stop() {
    _controller.setState(Finished(controller: _controller));
  }

  @override
  void dispose() {}
}

class Finished extends IntervalState {
  Finished({required super.controller});

  @override
  void next() {}

  @override
  void pause() {}

  @override
  void stop() {}

  @override
  void dispose() {}
}
