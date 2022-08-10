import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:interval/data/models/preset_model.dart';
import 'package:interval/data/preset_db.dart';
import 'package:interval/domain/entitites/preset.dart';

class PresetRepo {
  final PresetDB db;

  PresetRepo(this.db);

  List<Map<String, dynamic>> exportJson() {
    return db.getAllPreset().map((e) => e.toJson()).toList();
  }

  Future<void> importJson(List<Map<String, dynamic>> json) async {
    await db.drop();

    for (var item in json) {
      final preset = PresetModel.fromJson(item);
      await db.putPreset(null, preset);
    }
  }

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
