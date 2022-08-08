import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:interval/app/home/cubit/quick_start_cubit.dart';
import 'package:interval/app/interval/cubit/interval_cubit.dart';
import 'package:interval/app/interval/cubit/timer_cubit.dart';
import 'package:interval/domain/entitites/task.dart';
import 'package:interval/utils/duration_extension.dart';
import 'package:just_audio/just_audio.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../domain/entitites/loop.dart';
import '../app.dart';

class IntervalRoute extends StatefulWidget {
  static const routeName = 'interval';

  const IntervalRoute({super.key});

  @override
  State<IntervalRoute> createState() => _IntervalRouteState();
}

class _IntervalRouteState extends State<IntervalRoute> with RouteAware {
  final player = AudioPlayer()..setAsset("assets/sounds/tick.ogg");
  @override
  void initState() {
    super.initState();
    final homeState = context.read<QuickStartCubit>().state;
    Future.microtask(() {
      context.read<IntervalCubit>().start(homeState.toLoops());
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
    player.dispose();
    stopNotification();
    super.dispose();
  }

  @override
  void didPop() {
    context.read<TimerCubit>().stop();
    super.didPop();
  }

  Task getCurrentTask(
      IList<Loop> loops, int loopIndex, int set, int taskIndex) {
    return loops[loopIndex].tasks[taskIndex];
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
          timeleft.toFormattedString(),
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
            state.maybeWhen(
              running: (loops, loopIndex, set, taskIndex) {
                final currentTask = loops[loopIndex].tasks[taskIndex];

                context.read<TimerCubit>().start(currentTask);
              },
              finished: () {
                GoRouter.of(context).pop();
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<TimerCubit, TimerState>(
          listener: (context, state) {
            state.maybeWhen(
              running: (task, timeleft) {
                player.seek(Duration.zero);
                player.play();
                startNotification(task, timeleft);
              },
              finished: () {
                context.read<IntervalCubit>().next();
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: BlocBuilder<IntervalCubit, IntervalState>(
        builder: (context, state) {
          final currentTask = state.when(
            running: getCurrentTask,
            paused: getCurrentTask,
            finished: () => Task(
              name: "finished",
              duration: Duration.zero,
            ),
            initial: () => Task(
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
      // to not divide by zero add really small number
      percent: time.inSeconds / (total.inSeconds + 1e-5),
      progressColor: color,
      backgroundColor: color.withAlpha(125),
      radius: 128,
      lineWidth: 8,
      backgroundWidth: 8,
      circularStrokeCap: CircularStrokeCap.round,
      center: Text(
        time.toFormattedString(),
        style: const TextStyle(
          fontSize: 64,
          // color: Colors.white,
        ),
      ),
    );
  }
}
