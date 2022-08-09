import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  @HiveType(typeId: 3, adapterName: 'TaskAdapter')
  factory Task({
    @HiveField(1) required String name,
    @HiveField(2) required Duration duration,
    @HiveField(3) @Default(Colors.grey) Color color,
  }) = _Task;
}
