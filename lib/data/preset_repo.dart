import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:interval/data/models/preset_model.dart';
import 'package:interval/data/preset_db.dart';
import 'package:interval/domain/entitites/preset.dart';

class PresetRepo {
  final PresetDB db;

  PresetRepo(this.db);
  IList<Preset> getAllPreset() {
    return db.getAllPreset().map((e) => e.toEntity()).toIList();
  }

  IList<int> getAllKeys() {
    return db.getAllKeys().toIList();
  }

  Preset? getPreset(int id) {
    return db.getPreset(id)?.toEntity();
  }

  Future<int> putPreset(int? id, Preset value) {
    return db.putPreset(id, PresetModel.fromEntity(value));
  }

  Future<void> deletePreset(int key) {
    return db.deletePreset(key);
  }
}
