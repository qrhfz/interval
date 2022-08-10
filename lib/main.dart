import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:interval/data/adapters/duration_adapter.dart';
import 'package:interval/di.dart';

import 'app/app.dart';
import 'data/adapters/color_adapter.dart';
import 'data/models/loop_model.dart';
import 'data/models/preset_model.dart';
import 'data/models/task_model.dart';

void main() async {
  Hive.registerAdapter(DurationAdapter());
  Hive.registerAdapter(ColorAdapter());
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(LoopModelAdapter());
  Hive.registerAdapter(PresetModelAdapter());
  await Hive.initFlutter();
  await Hive.openBox<PresetModel>('presets');
  setup();
  runApp(MyApp());
}
