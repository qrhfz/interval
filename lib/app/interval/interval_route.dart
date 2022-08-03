import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval/app/home/cubit/quick_start_cubit.dart';
import 'package:interval/app/interval/cubit/interval_cubit.dart';
import 'package:interval/app/interval/cubit/timer_cubit.dart';
import 'package:just_audio/just_audio.dart';

import '../app.dart';

class IntervalRoute extends StatefulWidget {
  static const routeName = 'interval';

  const IntervalRoute({super.key});

  @override
  State<IntervalRoute> createState() => _IntervalRouteState();
}

class _IntervalRouteState extends State<IntervalRoute> with RouteAware {
  final player = AudioPlayer()..setAsset("assets/sounds/beep.ogg");
  @override
  void initState() {
    super.initState();
    final homeState = context.read<QuickStartCubit>().state;
    context.read<IntervalCubit>().start(homeState.toLoops());

    final intervalState = context.read<IntervalCubit>().state;
    intervalState.maybeWhen(
      running: (loops, loopIndex, set, taskIndex) {
        final currentTaskLength = loops[loopIndex].tasks[taskIndex].length;
        context.read<TimerCubit>().start(currentTaskLength);
      },
      orElse: () {},
    );
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
    super.dispose();
  }

  @override
  void didPop() {
    context.read<TimerCubit>().stop();
    super.didPop();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<IntervalCubit, IntervalState>(
          listener: (context, state) {
            state.maybeWhen(
              running: (loops, loopIndex, set, taskIndex) {
                context
                    .read<TimerCubit>()
                    .start(loops[loopIndex].tasks[taskIndex].length);
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<TimerCubit, TimerState>(
          listener: (context, state) {
            state.maybeWhen(
              running: (timeleft) {
                player.seek(Duration.zero);
                player.play();
              },
              finished: () {
                context.read<IntervalCubit>().next();
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          child: BlocBuilder<TimerCubit, TimerState>(
            builder: (context, state) {
              return state.maybeWhen(
                running: (_) => const Icon(Icons.pause),
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
          child: BlocBuilder<IntervalCubit, IntervalState>(
            builder: (context, state) {
              final String name = state.when(
                running: (loops, loopIndex, set, taskIndex) {
                  return loops[loopIndex].tasks[taskIndex].name;
                },
                paused: (loops, loopIndex, set, taskIndex) {
                  return loops[loopIndex].tasks[taskIndex].name;
                },
                initial: () => "-",
                finished: () => "finish",
              );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 64),
                  ),
                  BlocBuilder<TimerCubit, TimerState>(
                    builder: (context, state) {
                      final String time = state.when(
                        initial: () => "00:00",
                        running: (length) => length.toString(),
                        paused: (length) => length.toString(),
                        finished: () => "00:00",
                      );
                      return Text(
                        time,
                        style: const TextStyle(fontSize: 128),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
