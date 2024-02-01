import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval/app/interval/cubit/interval_cubit.dart';
import 'package:interval/app/interval/cubit/timer_cubit.dart';
import 'package:interval/app/notification_manager.dart';
import 'package:interval/audio.dart';
import 'package:interval/domain/entitites/task.dart';
import 'package:interval/utils/duration_extension.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../di.dart';
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
  bool mute = false;
  late final notifManager = NotificationManager(() {
    stop();
  });

  @override
  void initState() {
    super.initState();

    final preset = widget.preset;

    if (preset == null) return;
    Future.microtask(() {
      context.read<IntervalCubit>().start(preset.loops);
    });
  }

  void stop() {
    context.read<TimerCubit>().quit();
    context.read<IntervalCubit>().stop();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    stopNotification();
    super.dispose();
  }

  @override
  void didPop() {
    stop();
    super.didPop();
  }

  Future<void> startNotification(Task currentTask, Duration timeleft) async {
    notifManager.showTimer(
      currentTask.name,
      timeleft.toHHMMSS(),
    );
  }

  Future<void> stopNotification() async {
    notifManager.dismissTimer();
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
                getIt.get<AudioService>().tick();
                startNotification(task, timeleft);
              },
              finished: () {
                getIt.get<AudioService>().timesup();
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

                    getIt.get<AudioService>().setVolume(mute ? 0 : 100);
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    currentTask.name,
                    style: const TextStyle(
                        fontSize: 48,
                        // color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
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
