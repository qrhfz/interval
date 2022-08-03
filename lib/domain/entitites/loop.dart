import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interval/domain/entitites/task.dart';

part 'loop.freezed.dart';

@freezed
class Loop with _$Loop {
  factory Loop(
    IList<Task> tasks,
    int sets,
  ) = _Loop;
}
