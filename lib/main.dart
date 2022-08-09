import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:interval/di.dart';

import 'app/app.dart';
import 'data/models/preset_record.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<PresetRecord>('presets');
  setup();
  runApp(MyApp());
}
