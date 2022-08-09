import 'package:hive/hive.dart';
import 'package:interval/data/models/preset_record.dart';

class PresetDB {
  final box = Hive.box<PresetRecord>('presets');

  List<PresetRecord> getAllPreset() {
    return box.values.toList();
  }

  PresetRecord? getPreset(int key) {
    return box.get(key);
  }

  Future<void> putPreset(int key, PresetRecord value) {
    return box.put(key, value);
  }

  Future<void> deletePreset(int key) {
    return box.delete(key);
  }
}
