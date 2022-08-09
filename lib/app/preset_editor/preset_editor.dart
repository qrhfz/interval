import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:interval/app/preset_editor/cubit/editor_cubit.dart';
import 'package:interval/domain/entitites/loop.dart';
import 'package:interval/domain/entitites/task.dart';

class PresetEditor extends StatefulWidget {
  const PresetEditor({Key? key}) : super(key: key);
  static const String routeName = "editor";

  @override
  State<PresetEditor> createState() => _PresetEditorState();
}

class _PresetEditorState extends State<PresetEditor> {
  @override
  void initState() {
    super.initState();
    context.read<EditorCubit>().initNew();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditorCubit, EditorState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: state.when(
              initial: () => const Text(""),
              data: (key, preset) => Text(preset.name),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return PresetNameDialog();
                    },
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  context.read<EditorCubit>().save();
                },
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          body: state.when(
            initial: () => const Center(child: Text("empty")),
            data: (key, preset) {
              return CustomScrollView(
                slivers: preset.loops.asMap().entries.map((entry) {
                  final loop = entry.value;
                  final loopIndex = entry.key;

                  return SliverToBoxAdapter(
                    child: Card(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              MoveUpButton(loopIndex: loopIndex),
                              MoveDownButton(loopIndex: loopIndex),
                            ],
                          ),
                          Expanded(
                            child: ReorderableListView(
                              onReorder: (oldIndex, newIndex) {
                                context
                                    .read<EditorCubit>()
                                    .moveTask(loopIndex, oldIndex, newIndex);
                              },
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              footer: PresetFooter(loop: loop),
                              children: [
                                for (final task in loop.tasks)
                                  TaskListTile(
                                    task: task,
                                    key: ValueKey(task.hashCode),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        );
      },
    );
  }
}

class PresetNameDialog extends StatefulWidget {
  const PresetNameDialog({
    super.key,
  });

  @override
  State<PresetNameDialog> createState() => _PresetNameDialogState();
}

class _PresetNameDialogState extends State<PresetNameDialog> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = context.read<EditorCubit>().state.when(
          initial: () => "",
          data: (key, preset) => preset.name,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Change Preset Name"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: controller),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<EditorCubit>()
                        .updatePresetName(controller.text);
                    Navigator.of(context).pop();
                  },
                  child: const Text("Save"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

class PresetFooter extends StatelessWidget {
  const PresetFooter({
    Key? key,
    required this.loop,
  }) : super(key: key);

  final Loop loop;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(onPressed: () {}, child: Text('${loop.sets} Set')),
        TextButton(
          onPressed: () {},
          child: const Text('Add'),
        ),
      ],
    );
  }
}

class MoveDownButton extends StatelessWidget {
  const MoveDownButton({
    Key? key,
    required this.loopIndex,
  }) : super(key: key);

  final int loopIndex;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<EditorCubit>().moveLoopDown(loopIndex);
      },
      icon: const Icon(
        Icons.arrow_downward,
      ),
    );
  }
}

class MoveUpButton extends StatelessWidget {
  const MoveUpButton({
    Key? key,
    required this.loopIndex,
  }) : super(key: key);

  final int loopIndex;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<EditorCubit>().moveLoopUp(loopIndex);
      },
      icon: const Icon(
        Icons.arrow_upward,
      ),
    );
  }
}

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(shape: BoxShape.circle, color: task.color),
        ),
        title: Text(task.name),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
