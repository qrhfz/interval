import 'package:flutter/material.dart';
import 'package:interval/app/interval/interval_controller.dart';
import 'package:interval/app/interval/timer_auido_controller.dart';
import 'package:interval/di.dart';
import 'package:interval/utils/duration_extension.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../domain/entitites/preset.dart';
import '../app.dart';
import 'notification_manager.dart';

class IntervalRoute extends StatefulWidget {
  static const routeName = 'interval';

  final Preset? preset;
  const IntervalRoute(this.preset, {super.key});

  @override
  State<IntervalRoute> createState() => _IntervalRouteState();
}

class _IntervalRouteState extends State<IntervalRoute> with RouteAware {
  bool mute = false;
  late final IntervalController controller;
  late final NotificationManager notification;
  late final TimerAudioController timerAudioController;

  @override
  void initState() {
    super.initState();
    controller = IntervalController(widget.preset!);
    notification = NotificationManager(controller: controller);
    timerAudioController = TimerAudioController(controller);
    getIt.registerSingleton<IntervalController>(controller);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    notification.dismissTimer();
    controller.dispose();
    getIt.unregister<IntervalController>(instance: controller);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller.state,
      builder: (context, _) {
        final state = controller.state.value;

        return switch (state) {
          Running() => const RunningPage(),
          Paused() => const RunningPage(),
          Finished() => const FinishPage(),
        };
      },
    );
  }
}

class RunningPage extends StatefulWidget {
  const RunningPage({super.key});

  @override
  State<RunningPage> createState() => _RunningPageState();
}

class _RunningPageState extends State<RunningPage> {
  final IntervalController controller = getIt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: currentTask.color,
      appBar: AppBar(
        actions: const [
          // IconButton(
          //   onPressed: () {
          //     setState(() {
          //       mute = !mute;
          //     });

          //     getIt.get<AudioService>().setVolume(mute ? 0 : 100);
          //   },
          //   icon: Icon(mute ? Icons.volume_off : Icons.volume_up),
          // ),
        ],
      ),

      floatingActionButton: const PauseButton(),
      body: const SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TaskName(),
            TaskTimer(),
          ],
        ),
      ),
    );
  }
}

class FinishPage extends StatefulWidget {
  const FinishPage({super.key});

  @override
  State<FinishPage> createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  final IntervalController controller = getIt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Finished",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            ElevatedButton.icon(
              onPressed: () {
                controller.restart();
              },
              icon: const Icon(Icons.refresh),
              label: const Text("Restart"),
            )
          ],
        ),
      ),
    );
  }
}

class TaskName extends StatefulWidget {
  const TaskName({super.key});

  @override
  State<TaskName> createState() => _TaskNameState();
}

class _TaskNameState extends State<TaskName> {
  final IntervalController controller = getIt();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.state,
      builder: (context, state, _) {
        return switch (state) {
          Running() => textWidget(state.currentTask.name),
          Paused() => textWidget(state.currentTask.name),
          Finished() => const Placeholder(),
        };
      },
    );
  }

  Text textWidget(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class TaskTimer extends StatefulWidget {
  const TaskTimer({super.key});

  @override
  State<TaskTimer> createState() => _TaskTimerState();
}

class _TaskTimerState extends State<TaskTimer> {
  final IntervalController controller = getIt();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.state,
      builder: (context, state, _) {
        return switch (state) {
          Running() => ValueListenableBuilder(
              valueListenable: state.durationRemaning,
              builder: (context, remaining, _) {
                return TimerProgress(
                  time: remaining,
                  total: state.currentTask.duration,
                  color: state.currentTask.color,
                );
              }),
          Paused() => TimerProgress(
              time: state.durationRemaning,
              total: state.currentTask.duration,
              color: state.currentTask.color,
            ),
          _ => const Placeholder()
        };
      },
    );
  }
}

class PauseButton extends StatefulWidget {
  const PauseButton({super.key});

  @override
  State<PauseButton> createState() => _PauseButtonState();
}

class _PauseButtonState extends State<PauseButton> {
  final IntervalController controller = getIt();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: ValueListenableBuilder(
        valueListenable: controller.state,
        builder: (context, state, _) => switch (state) {
          Running() => const Icon(Icons.pause),
          Paused() => const Icon(Icons.play_arrow),
          Finished() => const Placeholder(),
        },
      ),
      onPressed: () {
        controller.pause();
      },
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
