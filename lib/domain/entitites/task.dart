import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  factory Task({
    required String name,
    required Duration duration,
    @Default(Colors.grey) Color color,
  }) = _Task;
}

class TaskAdapter extends TypeAdapter<Task> {
  @override
  Task read(BinaryReader reader) {
    final String name = reader.readString();
    final Duration duration = reader.read();
    final Color color = reader.read();
    return Task(name: name, duration: duration, color: color);
  }

  @override
  int get typeId => 3;

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeString(obj.name)
      ..write<Duration>(obj.duration)
      ..write<Color>(obj.color);
  }
}
