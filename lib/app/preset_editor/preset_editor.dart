import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval/app/preset_editor/cubit/editor_cubit.dart';

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
                onPressed: () {},
                icon: const Icon(Icons.edit),
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
                      child: ReorderableListView(
                        header: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.grey)),
                            color: Colors.white,
                          ),
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            onPressed: () {
                              context.read<EditorCubit>().moveLoopUp(loopIndex);
                            },
                            icon: const Icon(
                              Icons.arrow_upward,
                            ),
                          ),
                        ),
                        footer: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            border: Border(top: BorderSide(color: Colors.grey)),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<EditorCubit>()
                                      .moveLoopDown(loopIndex);
                                },
                                icon: const Icon(
                                  Icons.arrow_downward,
                                ),
                              ),
                              TextButton(
                                  onPressed: () {}, child: const Text("Add")),
                            ],
                          ),
                        ),
                        onReorder: (oldIndex, newIndex) {
                          context
                              .read<EditorCubit>()
                              .moveTask(loopIndex, oldIndex, newIndex);
                        },
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          for (final task in loop.tasks)
                            Container(
                              color: Colors.white,
                              key: Key(task.name),
                              child: ListTile(
                                leading: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: task.color),
                                ),
                                title: Text(task.name),
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit),
                                ),
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
