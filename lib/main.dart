import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:interval/di.dart';
import 'package:interval/domain/adapters/color_adapter.dart';
import 'package:interval/domain/adapters/duration_adapter.dart';
import 'package:interval/domain/entitites/loop.dart';
import 'package:interval/domain/entitites/preset.dart';
import 'package:interval/domain/entitites/task.dart';

import 'app/app.dart';

void main() async {
  Hive.registerAdapter(DurationAdapter());
  Hive.registerAdapter(ColorAdapter());
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(LoopAdapter());
  Hive.registerAdapter(PresetAdapter());
  await Hive.initFlutter();
  await Hive.openBox<Preset>('presets');
  setup();
  runApp(MyApp());
}
