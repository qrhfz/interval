import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:interval/app/interval/cubit/interval_cubit.dart';
import 'package:interval/app/interval/cubit/timer_cubit.dart';
import 'package:interval/domain/entitites/task.dart';
import 'package:interval/utils/duration_extension.dart';
import 'package:just_audio/just_audio.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../domain/entitites/preset.dart';
import '../app.dart';

class IntervalRoute extends StatefulWidget {
  static const routeName = 'interval';

  final Preset? preset;
  const IntervalRoute(this.preset, {super.key});

  @override
  State<IntervalRoute> createState() => _IntervalRouteState();
}

class _IntervalRouteState extends State<IntervalRoute> with RouteAware {
  final tickingPlayer = AudioPlayer()..setAsset("assets/sounds/tick.ogg");
  final timesUpPlayer = AudioPlayer()..setAsset("assets/sounds/timesup.ogg");
  bool mute = false;

  @override
  void initState() {
    super.initState();

    final preset = widget.preset;

    if (preset == null) return;
    Future.microtask(() {
      context.read<IntervalCubit>().start(preset.loops);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    tickingPlayer.dispose();
    timesUpPlayer.dispose();
    stopNotification();
    super.dispose();
  }

  @override
  void didPop() {
    context.read<TimerCubit>().stop();
    context.read<IntervalCubit>().stop();
    super.didPop();
  }

  Future<void> startNotification(Task currentTask, Duration timeleft) async {
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'color background channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      color: currentTask.color,
      colorized: true,
      playSound: false,
      enableVibration: false,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.startForegroundService(
          1,
          currentTask.name,
          timeleft.toMMSS(),
          notificationDetails: androidPlatformChannelSpecifics,
          payload: 'item x',
        );
  }

  Future<void> stopNotification() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.stopForegroundService();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<IntervalCubit, IntervalState>(
          listener: (context, state) {
            state.maybeMap(
              running: (running) {
                final currentTask = running.currentTask;

                context.read<TimerCubit>().start(currentTask);
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<TimerCubit, TimerState>(
          listener: (context, state) {
            state.maybeWhen(
              running: (task, timeleft) {
                tickingPlayer.seek(Duration.zero);
                tickingPlayer.play();
                startNotification(task, timeleft);
              },
              finished: () {
                timesUpPlayer.seek(Duration.zero);
                timesUpPlayer.play();
                context.read<IntervalCubit>().next();
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: BlocBuilder<IntervalCubit, IntervalState>(
        builder: (context, state) {
          final currentTask = state.map(
            running: (running) => running.currentTask,
            paused: (paused) => paused.currentTask,
            finished: (_) => Task(
              name: "finished",
              duration: Duration.zero,
            ),
            initial: (_) => Task(
              name: "-",
              duration: Duration.zero,
            ),
          );
          return Scaffold(
            // backgroundColor: currentTask.color,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              foregroundColor: Colors.red,
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      mute = !mute;
                    });
                    timesUpPlayer.setVolume(mute ? 0 : 100);
                    tickingPlayer.setVolume(mute ? 0 : 100);
                  },
                  icon: Icon(mute ? Icons.volume_off : Icons.volume_up),
                )
              ],
            ),

            floatingActionButton: FloatingActionButton(
              child: BlocBuilder<TimerCubit, TimerState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    running: (task, timeleft) => const Icon(Icons.pause),
                    orElse: () => const Icon(Icons.play_arrow),
                  );
                },
              ),
              onPressed: () {
                context.read<TimerCubit>().pause();
              },
            ),
            body: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    currentTask.name,
                    style: const TextStyle(
                        fontSize: 48,
                        // color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  BlocBuilder<TimerCubit, TimerState>(
                    builder: (context, state) {
                      final time = state.maybeWhen(
                        running: (task, timeleft) => timeleft,
                        paused: (task, timeleft) => timeleft,
                        orElse: () => Duration.zero,
                      );
                      return TimerProgress(
                        time: time,
                        total: currentTask.duration,
                        color: currentTask.color,
                      );
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class TimerProgress extends StatelessWidget {
  const TimerProgress({
    Key? key,
    required this.time,
    required this.total,
    required this.color,
  }) : super(key: key);

  final Duration time;
  final Duration total;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      percent: getPercentage(),
      progressColor: color,
      backgroundColor: color.withAlpha(125),
      radius: 128,
      lineWidth: 8,
      backgroundWidth: 8,
      circularStrokeCap: CircularStrokeCap.round,
      center: Text(
        time.toMMSS(),
        style: const TextStyle(
          fontSize: 64,
          // color: Colors.white,
        ),
      ),
    );
  }

  double getPercentage() =>
      total.inSeconds > 0 ? time.inSeconds / total.inSeconds : 0;
}
