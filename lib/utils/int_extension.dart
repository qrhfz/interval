extension IntExtension on int {
  String toStringZeroPadded([int width = 2]) {
    return toString().padLeft(width, '0');
  }
}
