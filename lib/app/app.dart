import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval/app/backup/cubit/backup_cubit.dart';
import 'package:interval/app/home/cubit/preset_cubit.dart';
import 'package:interval/app/home/home_route.dart';

final routeObserver = RouteObserver<ModalRoute<void>>();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PresetCubit()),
        BlocProvider(create: (context) => BackupCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Interval',
        home: const HomeRoute(),
        theme: ThemeData(
          useMaterial3: false,
          primarySwatch: Colors.red,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.white,
            foregroundColor: Colors.red,
          ),
        ),
      ),
    );
  }
}
