import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:interval/domain/entitites/preset.dart';

class PresetDB {
  final box = Hive.box<Preset>('presets');

  List<Preset> getAllPreset() {
    return box.values.toList();
  }

  Preset? getPreset(int key) {
    return box.get(key);
  }

  Future<int> putPreset(int? key, Preset value) async {
    if (key != null) {
      await box.put(key, value);
      return key;
    } else {
      final id = await box.add(value);
      return id;
    }
  }

  Future<void> deletePreset(int key) {
    return box.delete(key);
  }

  List<int> getAllKeys() {
    return box.keys.cast<int>().toList();
  }
}
