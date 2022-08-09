import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:interval/data/models/preset_record.dart';
import 'package:interval/data/preset_db.dart';
import 'package:interval/domain/entitites/preset.dart';

class PresetRepo {
  final PresetDB db;

  PresetRepo(this.db);
  IList<Preset> getAllPreset() {
    return db.getAllPreset().map((e) => e.toEntity()).toIList();
  }

  Preset? getPreset(int key) {
    return db.getPreset(key)?.toEntity();
  }

  Future<void> putPreset(int key, Preset value) {
    return db.putPreset(key, PresetRecord.fromEntity(value));
  }

  Future<void> deletePreset(int key) {
    return db.deletePreset(key);
  }
}
