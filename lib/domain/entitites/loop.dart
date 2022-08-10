import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interval/domain/entitites/task.dart';

part 'loop.freezed.dart';

@freezed
class Loop with _$Loop {
  // @HiveType(typeId: 4, adapterName: 'LoopAdapter')
  factory Loop({
    required IList<Task> tasks,
    required int sets,
  }) = _Loop;
}
