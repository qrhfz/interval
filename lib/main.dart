import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:interval/di.dart';
import 'package:interval/hive_init.dart';
import 'app/app.dart';
import 'audio.dart';

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async {
  await initializeHive();
  setup();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestPermission();
  await getIt.get<AudioService>().startAudioService();
  runApp(MyApp());
}
