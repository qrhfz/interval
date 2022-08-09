import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
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
                      return const PresetNameDialog();
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
            onPressed: () {
              context.read<EditorCubit>().addLoop();
            },
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
                              footer: PresetFooter(
                                loop: loop,
                                loopIndex: loopIndex,
                              ),
                              children: [
                                for (final entry in loop.tasks.asMap().entries)
                                  TaskListTile(
                                    task: entry.value,
                                    taskIndex: entry.key,
                                    loopIndex: loopIndex,
                                    key: ValueKey(entry.value.hashCode),
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
    Key? key,
  }) : super(key: key);

  @override
  State<PresetNameDialog> createState() => _PresetNameDialogState();
}

class _PresetNameDialogState extends State<PresetNameDialog> {
  final controller = TextEditingController();

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
    return ValueDialog(
      title: "Change Preset Name",
      onSaved: (context) {
        context.read<EditorCubit>().updatePresetName(controller.text);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(controller: controller),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class ValueDialog extends StatelessWidget {
  const ValueDialog({
    required this.title,
    required this.onSaved,
    required this.child,
    super.key,
  });

  final String title;
  final Widget child;
  final Function(BuildContext context) onSaved;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            child,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    onSaved(context);
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
}

class PresetFooter extends StatelessWidget {
  const PresetFooter({
    Key? key,
    required this.loop,
    required this.loopIndex,
  }) : super(key: key);

  final Loop loop;
  final int loopIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Remove this loop?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<EditorCubit>().removeLoop(loop);
                        Navigator.of(context).pop();
                      },
                      child: const Text('Confirm'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('Remove'),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return SetDialog(
                  loop: loop,
                  loopIndex: loopIndex,
                );
              },
            );
          },
          child: Text('${loop.sets} Set'),
        ),
        TextButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return TaskEditor(
                  onSaved: (task) {
                    context.read<EditorCubit>().addTaskToLoop(loopIndex, task);
                  },
                );
              },
            );
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}

class TaskEditor extends StatefulWidget {
  final Function(Task task) onSaved;
  final Task? task;
  const TaskEditor({
    this.task,
    required this.onSaved,
    Key? key,
  }) : super(key: key);
  static const colors = [
    Colors.red,
    Colors.purple,
    Colors.indigo,
    Colors.blue,
    Colors.cyan,
    Colors.lime,
    Colors.green,
    Colors.orange,
  ];

  @override
  State<TaskEditor> createState() => _TaskEditorState();
}

class _TaskEditorState extends State<TaskEditor> {
  Color selectedColor = Colors.red;
  final textController = TextEditingController();
  int minutes = 0;
  int seconds = 0;

  @override
  void initState() {
    super.initState();

    setState(() {
      final task = widget.task;
      if (task != null) {
        minutes = task.duration.inMinutes;
        seconds = task.duration.inSeconds % 60;
        textController.text = task.name;
        selectedColor = task.color;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: textController,
            decoration: const InputDecoration(
              label: Text('Name'),
            ),
          ),
        ),
        Wrap(
          children: [
            for (final color in TaskEditor.colors)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ColorSelectable(
                  color: color,
                  isSelected: color == selectedColor,
                  onSelected: (color) {
                    setState(() {
                      selectedColor = color;
                    });
                  },
                ),
              )
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 64,
              child: SpinBox(
                direction: Axis.vertical,
                min: 0,
                digits: 2,
                value: minutes.toDouble(),
                onChanged: (value) {
                  setState(() {
                    minutes = value.toInt();
                  });
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                ":",
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(
              width: 64,
              child: SpinBox(
                direction: Axis.vertical,
                min: 0,
                max: 59,
                digits: 2,
                value: seconds.toDouble(),
                onChanged: (value) {
                  setState(() {
                    seconds = value.toInt();
                  });
                },
              ),
            ),
          ],
        ),
        // const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                final task = Task(
                  name: textController.text,
                  duration: Duration(
                    minutes: minutes,
                    seconds: seconds,
                  ),
                  color: selectedColor,
                );
                widget.onSaved(task);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ),
        ),
      ],
    );
  }
}

class ColorSelectable extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final Function(Color) onSelected;

  const ColorSelectable({
    required this.color,
    required this.isSelected,
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected(color);
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: isSelected ? Border.all(width: 2, color: Colors.blue) : null,
        ),
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}

class SetDialog extends StatefulWidget {
  final Loop loop;
  final int loopIndex;
  const SetDialog({
    required this.loop,
    required this.loopIndex,
    super.key,
  });

  @override
  State<SetDialog> createState() => _SetDialogState();
}

class _SetDialogState extends State<SetDialog> {
  int count = 1;
  @override
  void initState() {
    super.initState();
    setState(() {
      count = widget.loop.sets;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueDialog(
      title: "Change Sets Count",
      onSaved: (context) {
        context.read<EditorCubit>().updateSetCount(widget.loopIndex, count);
      },
      child: SpinBox(
        min: 1,
        value: count.toDouble(),
        onChanged: (value) {
          setState(() {
            count = value.toInt();
          });
        },
      ),
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
    required this.loopIndex,
    required this.taskIndex,
  }) : super(key: key);

  final Task task;
  final int loopIndex;
  final int taskIndex;

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
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return TaskEditor(
                  onSaved: (task) {
                    context
                        .read<EditorCubit>()
                        .updateTask(loopIndex, taskIndex, task);
                  },
                  task: task,
                );
              },
            );
          },
          icon: const Icon(Icons.edit),
        ),
      ),
    );
  }
}