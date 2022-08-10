// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loop_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoopModelAdapter extends TypeAdapter<LoopModel> {
  @override
  final int typeId = 4;

  @override
  LoopModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoopModel(
      tasks: (fields[1] as List).cast<TaskModel>(),
      sets: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LoopModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.tasks)
      ..writeByte(2)
      ..write(obj.sets);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoopModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoopModel _$LoopModelFromJson(Map<String, dynamic> json) => LoopModel(
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sets: json['sets'] as int,
    );

Map<String, dynamic> _$LoopModelToJson(LoopModel instance) => <String, dynamic>{
      'tasks': instance.tasks,
      'sets': instance.sets,
    };
