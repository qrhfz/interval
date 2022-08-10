// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preset_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PresetModelAdapter extends TypeAdapter<PresetModel> {
  @override
  final int typeId = 5;

  @override
  PresetModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PresetModel(
      name: fields[1] as String,
      loops: (fields[2] as List).cast<LoopModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, PresetModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.loops);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PresetModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PresetModel _$PresetModelFromJson(Map<String, dynamic> json) => PresetModel(
      name: json['name'] as String,
      loops: (json['loops'] as List<dynamic>)
          .map((e) => LoopModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PresetModelToJson(PresetModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'loops': instance.loops,
    };
