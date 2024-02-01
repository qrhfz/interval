import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:interval/di.dart';
import 'package:interval/hive_init.dart';
import 'package:interval/route_notifier.dart';
import 'app/app.dart';

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async {
  await initializeHive();
  await initNotification();
  setup();
  runApp(MyApp());
}

Future<void> initNotification() async {
  final permit = await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestPermission();
  if (permit != true) {
    return;
  }
  const initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onSelectNotification: (String? payload) {
      routeListenable.value = true;
    },
  );
}
