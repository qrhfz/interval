import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/adapters/duration_adapter.dart';
import 'data/adapters/color_adapter.dart';
import 'data/models/loop_model.dart';
import 'data/models/preset_model.dart';
import 'data/models/task_model.dart';

Future<void> initializeHive() async {
  Hive.registerAdapter(DurationAdapter());
  Hive.registerAdapter(ColorAdapter());
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(LoopModelAdapter());
  Hive.registerAdapter(PresetModelAdapter());
  await Hive.initFlutter();
  final presetBox = await Hive.openBox<PresetModel>('presets');
  final prefsBox = await Hive.openBox('prefs');

  if (!prefsBox.get("app_ran", defaultValue: false)) {
    await presetBox.add(
      PresetModel(
        name: "Pomodoro",
        loops: [
          LoopModel(
            tasks: [
              TaskModel(
                name: "Work",
                duration: const Duration(minutes: 25),
                color: Colors.red,
              ),
              TaskModel(
                name: "Rest",
                duration: const Duration(minutes: 5),
                color: Colors.green,
              ),
            ],
            sets: 4,
          ),
          LoopModel(
            tasks: [
              TaskModel(
                name: "Work",
                duration: const Duration(minutes: 25),
                color: Colors.red,
              ),
              TaskModel(
                name: "Long Rest",
                duration: const Duration(minutes: 15),
                color: Colors.green,
              ),
            ],
            sets: 1,
          ),
        ],
      ),
    );
    await prefsBox.put("app_ran", true);
  }
}
