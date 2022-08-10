import 'package:hive/hive.dart';
import 'package:interval/data/models/preset_model.dart';

class PresetDB {
  final box = Hive.box<PresetModel>('presets');

  List<PresetModel> getAllPreset() {
    return box.values.toList();
  }

  PresetModel? getPreset(int id) {
    return box.get(id);
  }

  Future<int> putPreset(int? id, PresetModel value) async {
    if (id != null) {
      await box.put(id, value);
      return id;
    } else {
      final responseId = await box.add(value);
      return responseId;
    }
  }

  Future<void> deletePreset(int id) {
    return box.delete(id);
  }

  List<int> getAllKeys() {
    return box.keys.cast<int>().toList();
  }
}
