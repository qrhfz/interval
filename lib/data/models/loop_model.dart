import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hive/hive.dart';
import 'package:interval/data/models/task_model.dart';
import 'package:interval/domain/entitites/loop.dart';
import 'package:json_annotation/json_annotation.dart';

part 'loop_model.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class LoopModel extends HiveObject {
  @HiveField(1)
  final List<TaskModel> tasks;
  @HiveField(2)
  final int sets;

  LoopModel({
    required this.tasks,
    required this.sets,
  });

  factory LoopModel.fromEntity(Loop entity) {
    return LoopModel(
      sets: entity.sets,
      tasks: entity.tasks.map((e) {
        return TaskModel.fromEntity(e);
      }).toList(),
    );
  }

  Loop toEntity() => Loop(
        sets: sets,
        tasks: tasks.map((e) => e.toEntity()).toIList(),
      );

  factory LoopModel.fromJson(Map<String, dynamic> json) =>
      _$LoopModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoopModelToJson(this);
}
