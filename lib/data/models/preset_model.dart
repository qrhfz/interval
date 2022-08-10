import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:interval/data/models/loop_model.dart';
import 'package:interval/domain/entitites/preset.dart';
import 'package:json_annotation/json_annotation.dart';

part 'preset_model.g.dart';

@HiveType(typeId: 5)
@JsonSerializable()
class PresetModel extends HiveObject {
  @HiveField(1)
  final String name;
  @HiveField(2)
  final List<LoopModel> loops;

  PresetModel({
    required this.name,
    required this.loops,
  });

  factory PresetModel.fromEntity(Preset entity) {
    return PresetModel(
      name: entity.name,
      loops: entity.loops.map((e) {
        return LoopModel.fromEntity(e);
      }).toList(),
    );
  }

  Preset toEntity() => Preset(
        name: name,
        loops: loops.map((e) => e.toEntity()).toIList(),
      );

  factory PresetModel.fromJson(Map<String, dynamic> json) =>
      _$PresetModelFromJson(json);

  Map<String, dynamic> toJson() => _$PresetModelToJson(this);
}
