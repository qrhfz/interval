import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:interval/app/interval/cubit/timer_cubit.dart';
import 'package:interval/app/interval/interval_route.dart';

import 'home/home_route.dart';
import 'home/cubit/quick_start_cubit.dart';
import 'interval/cubit/interval_cubit.dart';

final routeObserver = RouteObserver<ModalRoute<void>>();
final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

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
            builder: (context, state) => const IntervalRoute(),
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
      ],
      child: MaterialApp.router(
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
