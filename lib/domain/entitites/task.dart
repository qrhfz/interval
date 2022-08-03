import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interval/domain/entitites/length.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  factory Task(
    String name,
    Length length,
  ) = _Task;
}
