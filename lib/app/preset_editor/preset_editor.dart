import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:interval/app/preset_editor/preset_editor_controller.dart';
import 'package:interval/di.dart';
import 'package:interval/utils/duration_extension.dart';

import 'task_editor.dart';

class PresetEditor extends StatefulWidget {
  final int? presetKey;

  const PresetEditor({this.presetKey, super.key});

  @override
  State<PresetEditor> createState() => _PresetEditorState();
}

class _PresetEditorState extends State<PresetEditor> {
  late final PresetEditorController controller;

  @override
  void initState() {
    super.initState();

    controller = PresetEditorController(key: widget.presetKey);

    getIt.registerSingleton(controller);
  }

  @override
  void dispose() {
    getIt.unregister(instance: controller);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return const PresetNameDialog();
              },
            );
          },
          child: ValueListenableBuilder(
            valueListenable: controller.state,
            builder: (context, state, _) {
              return Text(state.preset.name);
            },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.save();
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addLoop();
        },
        child: const Icon(Icons.add),
      ),
      body: PresetEditorBody(),
    );
  }
}

class PresetEditorBody extends StatelessWidget {
  PresetEditorBody({
    super.key,
  });

  final PresetEditorController controller = getIt();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.state,
      builder: (context, state, _) {
        final preset = state.preset;
        return CustomScrollView(
          slivers: [
            for (final (i, _) in preset.loops.indexed) LoopItem(i),
            TotalDuration(),
          ],
        );
      },
    );
  }
}

class LoopItem extends StatelessWidget {
  LoopItem(
    this.index, {
    super.key,
  });
  final int index;

  final PresetEditorController controller = getIt();

  @override
  Widget build(BuildContext context) {
    final loop = controller.state.value.preset.loops[index];

    return SliverToBoxAdapter(
      child: Card(
        child: Row(
          children: [
            Column(
              children: [
                MoveUpButton(loopIndex: index),
                MoveDownButton(loopIndex: index),
              ],
            ),
            Expanded(
              child: ReorderableListView(
                onReorder: (oldIndex, newIndex) {
                  controller.moveTask(index, oldIndex, newIndex);
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                footer: PresetFooter(
                  loopIndex: index,
                ),
                children: [
                  for (final (i, task) in loop.tasks.indexed)
                    TaskListTile(
                      taskIndex: i,
                      loopIndex: index,
                      key: Key("$index:$i:${task.hashCode}"),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TotalDuration extends StatelessWidget {
  final PresetEditorController controller = getIt();

  TotalDuration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final preset = controller.state.value.preset;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total duration"),
                Text(
                  preset.totelDuration.toHHMMSS(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
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
  final PresetEditorController controller = getIt();
  final txtCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    final preset = controller.state.value.preset;
    txtCtrl.text = preset.name;
  }

  @override
  Widget build(BuildContext context) {
    return ValueDialog(
      title: "Change Preset Name",
      onSaved: (context) {
        controller.updatePresetName(txtCtrl.text);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(controller: txtCtrl),
      ),
    );
  }

  @override
  void dispose() {
    txtCtrl.dispose();
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
  PresetFooter({
    Key? key,
    required this.loopIndex,
  }) : super(key: key);

  final int loopIndex;
  final PresetEditorController controller = getIt();

  @override
  Widget build(BuildContext context) {
    final loop = controller.state.value.preset.loops[loopIndex];

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
                        controller.removeLoop(loop);
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
              context: context,
              builder: (context) {
                return TaskEditor(
                  onSaved: (task) {
                    controller.addTaskToLoop(loopIndex, task);
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

class SetDialog extends StatefulWidget {
  final int loopIndex;
  const SetDialog({
    required this.loopIndex,
    super.key,
  });

  @override
  State<SetDialog> createState() => _SetDialogState();
}

class _SetDialogState extends State<SetDialog> {
  final PresetEditorController controller = getIt();

  int count = 1;
  @override
  void initState() {
    super.initState();

    final loop = controller.state.value.preset.loops[widget.loopIndex];

    setState(() {
      count = loop.sets;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueDialog(
      title: "Change Sets Count",
      onSaved: (context) {
        controller.updateSetCount(widget.loopIndex, count);
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
  final PresetEditorController controller = getIt();

  MoveDownButton({
    Key? key,
    required this.loopIndex,
  }) : super(key: key);

  final int loopIndex;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        controller.moveLoopDown(loopIndex);
      },
      icon: const Icon(
        Icons.arrow_downward,
      ),
    );
  }
}

class MoveUpButton extends StatelessWidget {
  final PresetEditorController controller = getIt();

  MoveUpButton({
    Key? key,
    required this.loopIndex,
  }) : super(key: key);

  final int loopIndex;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        controller.moveLoopUp(loopIndex);
      },
      icon: const Icon(
        Icons.arrow_upward,
      ),
    );
  }
}

class TaskListTile extends StatelessWidget {
  final PresetEditorController controller = getIt();

  TaskListTile({
    Key? key,
    required this.loopIndex,
    required this.taskIndex,
  }) : super(key: key);

  final int loopIndex;
  final int taskIndex;

  @override
  Widget build(BuildContext context) {
    final task =
        controller.state.value.preset.loops[loopIndex].tasks[taskIndex];

    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(shape: BoxShape.circle, color: task.color),
        ),
        title: Text(task.name),
        subtitle: Text(task.duration.toMMSS()),
        trailing: PopupMenuButton(
          itemBuilder: (_) {
            return [
              PopupMenuItem(
                onTap: () {
                  // add delay so onTap can open bottom sheet. huh?
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return TaskEditor(
                        task: task,
                        onSaved: (task) {
                          controller.updateTask(loopIndex, taskIndex, task);
                        },
                      );
                    },
                  );
                },
                child: const Text('Edit'),
              ),
              PopupMenuItem(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Delete Confirmation'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              controller.removeTask(loopIndex, taskIndex);
                              Navigator.of(context).pop();
                            },
                            child: const Text('Delete'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Remove'),
              ),
            ];
          },
        ),
      ),
    );
  }
}
