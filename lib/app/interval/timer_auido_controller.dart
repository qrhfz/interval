import 'package:interval/app/interval/interval_controller.dart';
import 'package:just_audio/just_audio.dart';

class TimerAudioController {
  final IntervalController intervalController;

  final bell = AudioPlayer();
  final bell2 = AudioPlayer();

  bool _isReady = false;

  TimerAudioController(this.intervalController) {
    Future.any([
      bell.setAsset("assets/sounds/bell.ogg"),
      bell2.setAsset("assets/sounds/bell2.ogg")
    ]).then((value) {
      _isReady = true;
    });

    intervalController.state.addListener(() {
      final state = intervalController.state.value;

      switch (state) {
        case Running():
          playSetDoneSound();
          break;
        default:
      }
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
}
