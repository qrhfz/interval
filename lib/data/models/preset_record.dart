import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:interval/domain/entitites/loop.dart';
import 'package:interval/domain/entitites/preset.dart';

part 'preset_record.g.dart';

@HiveType(typeId: 1)
class PresetRecord {
  @HiveField(0)
  String? name;

  @HiveField(1)
  List<Loop>? loops;

  PresetRecord({required this.name, required this.loops});

  Preset toEntity() {
    return Preset(
      name: name ?? "",
      loops: IList(loops),
    );
  }

  factory PresetRecord.fromEntity(Preset entity) {
    return PresetRecord(
      name: entity.name,
      loops: entity.loops.toList(),
    );
  }
}
