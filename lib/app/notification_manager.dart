import 'package:flutter/services.dart';

class NotificationManager {
  final void Function() onTimerDissmissed;

  NotificationManager(this.onTimerDissmissed) {
    channel.setMethodCallHandler((call) async {
      switch (call.method) {
        case "onTimerDismissed":
          onTimerDissmissed();
          break;
      }
    });
  }

  final channel = const MethodChannel('interval.qori.dev/notification');

  void showTimer(String taskName, String formattedDuration) {
    channel.invokeMethod("showTimer", {
      "taskName": taskName,
      "formattedDuration": formattedDuration,
    });
  }

  void dismissTimer() {
    channel.invokeMethod("dismissTimer");
  }

  void setOnTimerDismissed(void Function() onTimerDissmissed) {}
}
