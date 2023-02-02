import 'package:just_audio/just_audio.dart';

class AudioService {
  final tickingPlayer = AudioPlayer()..setAsset("assets/sounds/tick.ogg");
  final timesUpPlayer = AudioPlayer()..setAsset("assets/sounds/timesup.ogg");

  void setVolume(double n) {
    timesUpPlayer.setVolume(n);
    tickingPlayer.setVolume(n);
  }

  void tick() {
    tickingPlayer.seek(Duration.zero);
    tickingPlayer.play();
  }

  void timesup() {
    timesUpPlayer.seek(Duration.zero);
    timesUpPlayer.play();
  }
}
