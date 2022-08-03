import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:go_router/go_router.dart';
import 'package:interval/app/interval/interval_route.dart';
import '../../domain/entitites/length.dart';
import '/app/home/cubit/home_cubit.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TimeInput(
                "WORK",
                timespan: state.work,
                setMinutes: (val) {
                  context.read<HomeCubit>().setWorkMinutes(val.toInt());
                },
                setSeconds: (val) {
                  context.read<HomeCubit>().setWorkSeconds(val.toInt());
                },
              ),
              TimeInput(
                "REST",
                timespan: state.rest,
                setMinutes: (val) {
                  context.read<HomeCubit>().setRestMinutes(val.toInt());
                },
                setSeconds: (val) {
                  context.read<HomeCubit>().setRestSeconds(val.toInt());
                },
              ),
              LapInput(state.lap, onChanged: (value) {
                context.read<HomeCubit>().setLap(value.toInt());
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

class LapInput extends StatelessWidget {
  const LapInput(
    this.value, {
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final int value;
  final Function(double) onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "LAP",
            style: TextStyle(fontSize: 24),
          ),
        ),
        SizedBox(
          width: 128,
          child: SpinBox(
            value: value.toDouble(),
            min: 1,
            onChanged: onChanged,
          ),
        )
      ],
    );
  }
}

class TimeInput extends StatelessWidget {
  final String name;
  final Length timespan;
  final Function(double) setSeconds;
  final Function(double) setMinutes;

  const TimeInput(
    this.name, {
    required this.timespan,
    required this.setMinutes,
    required this.setSeconds,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return UpdateTimeDialog(
              timespan: timespan,
              setMinutes: setMinutes,
              setSeconds: setSeconds,
            );
          },
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              timespan.toString(),
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}

class UpdateTimeDialog extends StatelessWidget {
  final Function(double) setSeconds;
  final Function(double) setMinutes;
  final Length timespan;

  const UpdateTimeDialog({
    required this.setMinutes,
    required this.setSeconds,
    required this.timespan,
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
              value: timespan.minutes.toDouble(),
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
              value: timespan.seconds.toDouble(),
              min: 0,
              max: 59,
            ),
          ),
        ],
      ),
    ));
  }
}
