import 'package:flutter/services.dart';

class NotificationManager {
  final VoidCallback? onStopped;
  final VoidCallback? onPaused;

  NotificationManager({this.onStopped, this.onPaused}) {
    _channel.setMethodCallHandler((call) async {
      switch (call.method) {
        case "onTimerDismissed":
          onStopped?.call();
          break;
        case "onTimerPaused":
          onPaused?.call();
          break;
      }
    });

    // void handler() {
    //   final state = controller.state.value;
    //   switch (state) {
    //     case Running():
    //       _subscribeToTimerUpdate(state);
    //       break;
    //     case Paused():
    //       showTimer(
    //         state.currentTask.name,
    //         state.durationRemaning.toHHMMSS(),
    //         true,
    //       );
    //       break;
    //     case Finished():
    //       break;
    //   }
    // }

    // handler();
    // controller.state.addListener(handler);
  }

  final _channel = const MethodChannel('interval.qori.dev/notification');

  void showTimer(String taskName, String formattedDuration, bool isPaused) {
    _channel.invokeMethod("showTimer", {
      "taskName": taskName,
      "formattedDuration": formattedDuration,
      "isPaused": isPaused,
    });
  }

  void dismissTimer() {
    _channel.invokeMethod("dismissTimer");
  }

  // void _subscribeToTimerUpdate(Running state) {
  //   void show() {
  //     showTimer(
  //       state.currentTask.name,
  //       state.durationRemaning.value.toHHMMSS(),
  //       false,
  //     );
  //   }

  //   show();
  //   state.durationRemaning.addListener(show);
  // }
}

enum NotificationAction {
  pause,
  stop,
}
