import 'package:flutter/material.dart';

import '../../domain/entitites/task.dart';
import '../widgets/duration_field.dart';
import 'color_selector.dart';

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
  final textController = TextEditingController();

  late Task task = widget.task ??
      Task(
        name: "Work",
        duration: const Duration(minutes: 1),
      );

  @override
  void initState() {
    super.initState();
    textController.text = task.name;
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: textController,
              onChanged: (name) {
                task = task.copyWith(name: name);
              },
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
                  child: ColorSelecor(
                    color: color,
                    isSelected: color == task.color,
                    onSelected: (color) {
                      setState(() {
                        task = task.copyWith(color: color);
                      });
                    },
                  ),
                )
            ],
          ),
          DurationField(
            value: task.duration,
            onDurationChange: (dur) {
              setState(() {
                task = task.copyWith(duration: dur);
              });
            },
          ),
          // const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  widget.onSaved(task);
                  Navigator.of(context).pop();
                },
                child: const Text('Save'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
