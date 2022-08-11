import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval/app/backup/cubit/backup_cubit.dart';
import 'package:interval/app/home/cubit/preset_cubit.dart';

class BackupPage extends StatelessWidget {
  const BackupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<BackupCubit, BackupState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          fail: (msg) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(msg)),
            );
          },
          success: (msg) {
            context.read<PresetCubit>().fetchData();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(msg)),
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Backup')),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const Text("Export your presets into a .json file"),
              ElevatedButton(
                onPressed: () {
                  context.read<BackupCubit>().export();
                },
                child: const Text('Export'),
              ),
              const Spacer(),
              const Text(
                  "Import your presets from your previously created .json file"),
              ElevatedButton(
                onPressed: () {
                  context.read<BackupCubit>().import();
                },
                child: const Text('Import'),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
