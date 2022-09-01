import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:interval/app/backup/backup_page.dart';
import 'package:interval/app/backup/cubit/backup_cubit.dart';
import 'package:interval/app/home/cubit/preset_cubit.dart';
import 'package:interval/app/interval/cubit/timer_cubit.dart';
import 'package:interval/app/interval/interval_route.dart';

import '../domain/entitites/preset.dart';
import 'home/home_route.dart';
import 'home/cubit/quick_start_cubit.dart';
import 'interval/cubit/interval_cubit.dart';
import 'preset_editor/cubit/editor_cubit.dart';
import 'preset_editor/preset_editor.dart';

final routeObserver = RouteObserver<ModalRoute<void>>();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeRoute(),
        routes: [
          GoRoute(
            name: IntervalRoute.routeName,
            path: 'interval',
            builder: (context, state) {
              final preset = state.extra as Preset?;
              return IntervalRoute(preset);
            },
          ),
          GoRoute(
            name: 'backup',
            path: 'backup',
            builder: (context, state) {
              return const BackupPage();
            },
          ),
          GoRoute(
            name: PresetEditor.routeName,
            path: 'editor',
            builder: (context, state) {
              log(state.extra.runtimeType.toString());
              final extra = state.extra as List<Object>?;
              if (extra != null) {
                return PresetEditor(
                  presetKey: extra[0] as int,
                  preset: extra[1] as Preset,
                );
              }
              return const PresetEditor();
            },
          ),
        ],
      ),
    ],
    observers: [routeObserver],
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => QuickStartCubit()),
        BlocProvider(create: (context) => IntervalCubit()),
        BlocProvider(create: (context) => TimerCubit()),
        BlocProvider(create: (context) => PresetCubit()),
        BlocProvider(create: (context) => EditorCubit()),
        BlocProvider(create: (context) => BackupCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
        title: 'Flutter Demo',
        theme: ThemeData(
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
