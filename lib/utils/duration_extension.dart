import 'int_extension.dart';

extension DurationExtension on Duration {
  String toFormattedString() {
    final minutes = inMinutes % 60;
    final seconds = inSeconds % 60;

    return "${minutes.toStringZeroPadded()}:${seconds.toStringZeroPadded()}";
  }
}
