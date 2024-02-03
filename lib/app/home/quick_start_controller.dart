import 'package:flutter/foundation.dart';

class QuickStartController {
  final _sets = ValueNotifier(3);
  final work = ValueNotifier<Duration>(const Duration(minutes: 3));
  final rest = ValueNotifier<Duration>(const Duration(minutes: 1));

  ValueListenable<int> get sets => _sets;

  void setSets(int value) {
    if (value < 1) return;
    _sets.value = value;
  }

  void descrementSets() {}
}
