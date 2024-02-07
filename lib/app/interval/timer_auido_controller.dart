import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

class TimerAudioController {
  final bell = AudioPlayer();
  final bell2 = AudioPlayer();

  final _mute = ValueNotifier(false);
  ValueListenable<bool> get mute => _mute;

  bool _isReady = false;

  TimerAudioController() {
    Future.any([
      bell.setAsset("assets/sounds/bell.ogg"),
      bell2.setAsset("assets/sounds/bell2.ogg")
    ]).then((value) {
      _isReady = true;
    });

    mute.addListener(() {
      setVolume(mute.value ? 0 : 100);
    });
  }

  void setVolume(double n) {
    if (!_isReady) return;

    bell.setVolume(n);
    bell2.setVolume(n);
  }

  void playSetDoneSound() {
    if (!_isReady) return;

    bell.seek(Duration.zero);
    bell.play();
  }

  void finish() {
    if (!_isReady) return;

    bell2.seek(Duration.zero);
    bell2.play();
  }

  void muteVolume() {
    _mute.value = !_mute.value;
  }
}
