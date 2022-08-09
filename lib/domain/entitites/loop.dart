import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';
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

class LoopAdapter extends TypeAdapter<Loop> {
  @override
  Loop read(BinaryReader reader) {
    final tasks = reader.readList().cast<Task>().toIList();
    final sets = reader.readInt();
    return Loop(tasks: tasks, sets: sets);
  }

  @override
  int get typeId => 4;

  @override
  void write(BinaryWriter writer, Loop obj) {
    writer
      ..writeList(obj.tasks.toList())
      ..writeInt(obj.sets);
  }
}
