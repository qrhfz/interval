import 'dart:isolate';

import 'package:flutter/widgets.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:just_audio/just_audio.dart';

class AudioService {
  SendPort? audioSendPort;

  Future<void> startAudioService() async {
    final mainReceivePort = ReceivePort();
    await FlutterIsolate.spawn(audio, mainReceivePort.sendPort);

    audioSendPort = await mainReceivePort.first;
  }

  void setVolume(double n) {
    audioSendPort?.send(n);
  }

  void tick() {
    audioSendPort?.send("tick");
  }

  void timesup() {
    audioSendPort?.send("timesup");
  }

  static void audio(SendPort mainSendPort) {
    final tickingPlayer = AudioPlayer()..setAsset("assets/sounds/tick.ogg");
    final timesUpPlayer = AudioPlayer()..setAsset("assets/sounds/timesup.ogg");

    final audioReceivePort = ReceivePort();

    mainSendPort.send(audioReceivePort.sendPort);

    audioReceivePort.listen((message) {
      if (message is double) {
        timesUpPlayer.setVolume(message);
        tickingPlayer.setVolume(message);
        return;
      }

      switch (message) {
        case "tick":
          tickingPlayer.seek(Duration.zero);
          tickingPlayer.play();
          break;
        case "timesup":
          timesUpPlayer.seek(Duration.zero);
          timesUpPlayer.play();
          break;
      }
    });
  }
}
