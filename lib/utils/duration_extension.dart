import 'int_extension.dart';

extension DurationExtension on Duration {
  String toMMSS() {
    final seconds = inSeconds % 60;

    return "${inMinutes.toStringZeroPadded()}:${seconds.toStringZeroPadded()}";
  }

  String toHHMMSS() {
    final minutes = inMinutes % 60;
    final seconds = inSeconds % 60;

    return "${inHours.toStringZeroPadded()}:${minutes.toStringZeroPadded()}:${seconds.toStringZeroPadded()}";
  }
}
