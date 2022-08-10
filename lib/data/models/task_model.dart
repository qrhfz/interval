import 'dart:ui';

import 'package:hive/hive.dart';
import 'package:interval/domain/entitites/task.dart';
import 'package:json_annotation/json_annotation.dart';
part 'task_model.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class TaskModel extends HiveObject {
  @HiveField(1)
  final String name;

  @HiveField(2)
  @JsonKey(
    fromJson: durationFromJson,
    toJson: durationToJson,
  )
  final Duration duration;

  @HiveField(3)
  @JsonKey(
    fromJson: colorFromJson,
    toJson: colorToJson,
  )
  final Color color;

  TaskModel({
    required this.name,
    required this.duration,
    required this.color,
  });

  factory TaskModel.fromEntity(Task entity) {
    return TaskModel(
      name: entity.name,
      duration: entity.duration,
      color: entity.color,
    );
  }

  Task toEntity() => Task(name: name, duration: duration);

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

  static int durationToJson(Duration input) {
    return input.inMicroseconds;
  }

  static Duration durationFromJson(int input) {
    return Duration(microseconds: input);
  }

  static int colorToJson(Color input) {
    return input.value;
  }

  static Color colorFromJson(int input) {
    return Color(input);
  }
}
