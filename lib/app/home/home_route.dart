import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:go_router/go_router.dart';
import 'package:interval/app/home/cubit/quick_start_state.dart';
import 'package:interval/app/interval/interval_route.dart';
import 'package:interval/utils/duration_extension.dart';
import '../app.dart';
import 'cubit/quick_start_cubit.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  void initState() {
    super.initState();

    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  void selectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    GoRouter.of(context).goNamed("interval");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuickStartCubit, QuickStartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TimeInput(
                "Work",
                minutes: state.workMins,
                seconds: state.workSecs,
                setMinutes: (val) {
                  context.read<QuickStartCubit>().setWorkMinutes(val.toInt());
                },
                setSeconds: (val) {
                  context.read<QuickStartCubit>().setWorkSeconds(val.toInt());
                },
              ),
              TimeInput(
                "Rest",
                minutes: state.restMins,
                seconds: state.restSecs,
                setMinutes: (val) {
                  context.read<QuickStartCubit>().setRestMinutes(val.toInt());
                },
                setSeconds: (val) {
                  context.read<QuickStartCubit>().setRestSeconds(val.toInt());
                },
              ),
              SetsInput(state.sets, onChanged: (value) {
                context.read<QuickStartCubit>().setLap(value.toInt());
              }),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              GoRouter.of(context).goNamed(IntervalRoute.routeName);
            },
            child: const Icon(Icons.play_arrow),
          ),
        );
      },
    );
  }
}

class SetsInput extends StatelessWidget {
  const SetsInput(
    this.value, {
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final int value;
  final Function(double) onChanged;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: SizedBox(
                  width: 128,
                  child: SpinBox(
                    value: value.toDouble(),
                    min: 1,
                    onChanged: onChanged,
                  ),
                ),
              );
            },
          );
        },
        title: const Text(
          "Sets",
          style: TextStyle(fontSize: 24),
        ),
        trailing: Text(
          value.toString(),
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class TimeInput extends StatelessWidget {
  final String name;
  final int minutes;
  final int seconds;
  final Function(double) setSeconds;
  final Function(double) setMinutes;

  const TimeInput(
    this.name, {
    required this.minutes,
    required this.seconds,
    required this.setMinutes,
    required this.setSeconds,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    void showInputDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return UpdateTimeDialog(
            minutes: minutes,
            seconds: seconds,
            setMinutes: setMinutes,
            setSeconds: setSeconds,
          );
        },
      );
    }

    return Card(
      child: ListTile(
        onTap: showInputDialog,
        title: Text(
          name,
          style: const TextStyle(fontSize: 24),
        ),
        trailing: Text(
          Duration(
            minutes: minutes,
            seconds: seconds,
          ).toFormattedString(),
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class UpdateTimeDialog extends StatelessWidget {
  final Function(double) setSeconds;
  final Function(double) setMinutes;
  final int minutes;
  final int seconds;

  const UpdateTimeDialog({
    required this.setMinutes,
    required this.setSeconds,
    required this.minutes,
    required this.seconds,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 64,
            child: SpinBox(
              direction: Axis.vertical,
              digits: 2,
              onChanged: setMinutes,
              value: minutes.toDouble(),
              min: 0,
            ),
          ),
          const SizedBox(
            width: 32,
            child: Text(
              ":",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32),
            ),
          ),
          SizedBox(
            width: 64,
            child: SpinBox(
              direction: Axis.vertical,
              digits: 2,
              onChanged: setSeconds,
              value: seconds.toDouble(),
              min: 0,
              max: 59,
            ),
          ),
        ],
      ),
    ));
  }
}
