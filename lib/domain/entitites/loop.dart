import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interval/domain/entitites/task.dart';

part 'loop.freezed.dart';

@freezed
class Loop with _$Loop {
  const Loop._();
  factory Loop({
    required IList<Task> tasks,
    required int sets,
  }) = _Loop;

  Duration get totelDuration {
    if (tasks.isEmpty) {
      return Duration.zero;
    }

    return tasks
            .map((element) => element.duration)
            .reduce((prev, next) => prev + next) *
        sets;
  }
}
