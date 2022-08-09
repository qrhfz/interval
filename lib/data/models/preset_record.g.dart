// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preset_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PresetRecordAdapter extends TypeAdapter<PresetRecord> {
  @override
  final int typeId = 1;

  @override
  PresetRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PresetRecord(
      name: fields[0] as String?,
      loops: (fields[1] as List?)?.cast<Loop>(),
    );
  }

  @override
  void write(BinaryWriter writer, PresetRecord obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.loops);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PresetRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
