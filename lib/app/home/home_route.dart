import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:interval/app/home/cubit/preset_cubit.dart';
import 'package:interval/app/home/quick_start_controller.dart';
import 'package:interval/app/interval/interval_route.dart';
import 'package:interval/domain/entitites/loop.dart';
import 'package:interval/domain/entitites/preset.dart';
import 'package:interval/domain/entitites/task.dart';
import 'package:interval/utils/duration_extension.dart';
import '../preset_editor/preset_editor.dart';
import '../widgets/duration_field.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interval"),
        actions: const [HomeMenu()],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: QuickStartWidget(),
          ),
          const PresetListHeader(),
          const PresetList(),
        ],
      ),
    );
  }
}

class HomeMenu extends StatelessWidget {
  const HomeMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void goToBackupPage() {
      GoRouter.of(context).goNamed('backup');
    }

    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: const Text('Backup'),
            onTap: () async {
              await Future.delayed(const Duration(microseconds: 17));
              goToBackupPage();
            },
          ),
        ];
      },
    );
  }
}

class PresetListHeader extends StatelessWidget {
  const PresetListHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Text(
              "Presets",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                context.read<PresetCubit>().fetchData();
              },
              icon: const Icon(Icons.refresh),
            ),
            TextButton.icon(
              onPressed: () {
                GoRouter.of(context).goNamed(PresetEditor.routeName);
              },
              icon: const Icon(Icons.add),
              label: const Text("New"),
            ),
          ],
        ),
      ),
    );
  }
}

class PresetList extends StatefulWidget {
  const PresetList({
    Key? key,
  }) : super(key: key);

  @override
  State<PresetList> createState() => _PresetListState();
}

class _PresetListState extends State<PresetList> {
  @override
  void initState() {
    super.initState();
    load();
  }

  void load() {
    context.read<PresetCubit>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PresetCubit, PresetState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text('Presets is Empty')),
          ),
          data: (keys, presets) => SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final preset = presets[index];
                final key = keys[index];
                return Card(
                  child: ListTile(
                    title: Text(preset.name),
                    subtitle: Text(preset.totelDuration.toHHMMSS()),
                    leading: IconButton(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () {
                        GoRouter.of(context).goNamed(
                          IntervalRoute.routeName,
                          extra: preset,
                        );
                      },
                    ),
                    trailing: PopupMenuButton(
                      itemBuilder: (_) {
                        return [
                          PopupMenuItem(
                            onTap: () async {
                              PresetEditor.go(context, key);
                            },
                            child: const Text('Edit'),
                          ),
                          PopupMenuItem(
                            onTap: () async {
                              context.read<PresetCubit>().remove(key);
                            },
                            child: const Text('Remove'),
                          ),
                        ];
                      },
                    ),
                  ),
                );
              },
              childCount: presets.length,
            ),
          ),
        );
      },
    );
  }
}

class QuickStartWidget extends StatelessWidget {
  QuickStartWidget({
    Key? key,
  }) : super(key: key);

  final controller = QuickStartController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Quick Start",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  const Text("Work"),
                  const Spacer(),
                  ListenableBuilder(
                    listenable: controller.work,
                    builder: (context, _) {
                      return DurationField(
                        value: controller.work.value,
                        onDurationChange: (duration) {
                          controller.work.value = duration;
                        },
                      );
                    },
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  const Text("Rest"),
                  const Spacer(),
                  ListenableBuilder(
                      listenable: controller.rest,
                      builder: (context, _) {
                        return DurationField(
                          value: controller.rest.value,
                          onDurationChange: (duration) {
                            controller.rest.value = duration;
                          },
                        );
                      }),
                ],
              ),
              const Divider(),
              ListenableBuilder(
                listenable: controller.sets,
                builder: (context, _) {
                  return SetsInput(
                    controller.sets.value,
                    onChanged: (value) {
                      controller.setSets(value);
                    },
                  );
                },
              ),
              TextButton.icon(
                onPressed: () {
                  final preset = Preset(
                    name: "Quick Start",
                    loops: IList([
                      Loop(
                        tasks: IList([
                          Task(name: "Work", duration: controller.work.value),
                          Task(name: "Rest", duration: controller.rest.value),
                        ]),
                        sets: controller.sets.value,
                      )
                    ]),
                  );
                  GoRouter.of(context).goNamed(
                    IntervalRoute.routeName,
                    extra: preset,
                  );
                },
                icon: const Icon(Icons.play_arrow),
                label: const Text('Play'),
              )
            ],
          ),
        ),
      ),
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
  final Function(int) onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Sets",
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            onChanged(value - 1);
          },
          icon: const Icon(Icons.remove),
        ),
        Text(
          value.toString(),
          style: const TextStyle(fontSize: 18),
        ),
        IconButton(
          onPressed: () {
            onChanged(value + 1);
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
