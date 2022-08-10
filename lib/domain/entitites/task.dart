import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  factory Task({
    required String name,
    required Duration duration,
    @Default(Colors.red) Color color,
  }) = _Task;
}
