import 'package:flutter/services.dart';
import 'package:interval/utils/duration_extension.dart';

import 'interval/interval_controller.dart';

class NotificationManager {
  final IntervalController controller;

  NotificationManager({required this.controller}) {
    channel.setMethodCallHandler((call) async {
      switch (call.method) {
        case "onTimerDismissed":
          controller.stop();
          break;
      }
    });

    void handler() {
      final state = controller.state.value;
      switch (state) {
        case Running():
          _subscribeToTimerUpdate(state);
          break;
        case Paused():
          showTimer(
            state.currentTask.name,
            state.durationRemaning.toHHMMSS(),
            true,
          );
          break;
        case Finished():
          break;
      }
    }

    handler();
    controller.state.addListener(handler);
  }

  final channel = const MethodChannel('interval.qori.dev/notification');

  void showTimer(String taskName, String formattedDuration, bool isPaused) {
    channel.invokeMethod("showTimer", {
      "taskName": taskName,
      "formattedDuration": formattedDuration,
      "isPaused": isPaused,
    });
  }

  void dismissTimer() {
    channel.invokeMethod("dismissTimer");
  }

  void _subscribeToTimerUpdate(Running state) {
    void show() {
      showTimer(
        state.currentTask.name,
        state.durationRemaning.value.toHHMMSS(),
        false,
      );
    }

    show();
    state.durationRemaning.addListener(show);
  }
}
