import 'package:flutter/material.dart';
import 'package:interval/app/interval/interval_controller.dart';
import 'package:interval/app/notification_manager.dart';
import 'package:interval/di.dart';
import 'package:interval/domain/entitites/task.dart';
import 'package:interval/utils/duration_extension.dart';
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
  bool mute = false;
  late final controller = IntervalController(widget.preset!);

  late final notifManager = NotificationManager(() {
    controller.stop();
  });

  @override
  void initState() {
    super.initState();
    getIt.registerSingleton<IntervalController>(controller);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPop() {
    controller.stop();
    super.didPop();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    stopNotification();
    getIt.unregister<IntervalController>(instance: controller);
    super.dispose();
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
    return ListenableBuilder(
      listenable: controller.state,
      builder: (context, _) {
        final state = controller.state.value;

        return switch (state) {
          Running() => const RunningPage(),
          Paused() => const Placeholder(),
          Finished() => const Placeholder(),
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.red,
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

      floatingActionButton: PauseButton(controller: controller),
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
        final runningState = state as Running;
        return Text(
          runningState.currentTask.name,
          style: const TextStyle(
            fontSize: 48,
            // color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        );
      },
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
    final state = controller.state.value;

    return switch (state) {
      Running() => ValueListenableBuilder(
          valueListenable: state.durationRemaning,
          builder: (context, remaning, _) {
            return TimerProgress(
                time: remaning,
                total: state.currentTask.duration,
                color: state.currentTask.color);
          },
        ),
      Paused() => TimerProgress(
          time: state.durationRemaning,
          total: state.currentTask.duration,
          color: state.currentTask.color,
        ),
      Finished() => const Placeholder(),
    };
  }
}

class PauseButton extends StatefulWidget {
  const PauseButton({
    super.key,
    required this.controller,
  });

  final IntervalController controller;

  @override
  State<PauseButton> createState() => _PauseButtonState();
}

class _PauseButtonState extends State<PauseButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: ListenableBuilder(
        listenable: widget.controller.state,
        builder: (context, _) => switch (widget.controller.state.value) {
          Running() => const Icon(Icons.pause),
          Paused() => const Icon(Icons.play_arrow),
          Finished() => const Placeholder(),
        },
      ),
      onPressed: () {
        widget.controller.pause();
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
