import 'package:flutter/material.dart';
import 'package:interval/di.dart';
import 'package:interval/hive_init.dart';
import 'app/app.dart';

void main() async {
  await initializeHive();
  setup();
  runApp(const MyApp());
}
