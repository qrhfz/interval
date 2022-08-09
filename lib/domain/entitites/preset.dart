import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'loop.dart';

part 'preset.freezed.dart';

@freezed
class Preset with _$Preset {
  // @HiveType(typeId: 5, adapterName: 'PresetAdapter')
  factory Preset({
    required String name,
    required IList<Loop> loops,
  }) = _Preset;
}

class PresetAdapter extends TypeAdapter<Preset> {
  @override
  Preset read(BinaryReader reader) {
    final name = reader.readString();
    final loops = reader.readList().cast<Loop>().toIList();

    return Preset(name: name, loops: loops);
  }

  @override
  int get typeId => 5;

  @override
  void write(BinaryWriter writer, Preset obj) {
    writer
      ..writeString(obj.name)
      ..writeList(obj.loops.toList());
  }
}
