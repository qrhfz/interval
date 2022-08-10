import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';

import 'dart:ui';

class ColorAdapter extends TypeAdapter<Color> {
  @override
  Color read(BinaryReader reader) {
    return Color(reader.readInt());
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, Color obj) {
    writer.writeInt(obj.value);
  }
}
