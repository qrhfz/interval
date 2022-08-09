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

  Future<void> putPreset(int? key, Preset value) async {
    if (key != null) {
      return await box.put(key, value);
    } else {
      final id = await box.add(value);
      log("$id");
    }
  }

  Future<void> deletePreset(int key) {
    return box.delete(key);
  }
}
