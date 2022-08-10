import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interval/data/preset_repo.dart';
import 'package:path_provider/path_provider.dart';

import '../../../di.dart';

part 'backup_state.dart';
part 'backup_cubit.freezed.dart';

class BackupCubit extends Cubit<BackupState> {
  BackupCubit() : super(const BackupState.initial());

  final repo = getIt.get<PresetRepo>();

  Future<void> export() async {
    String? selectedDirectory = await FilePicker.platform
        .getDirectoryPath(initialDirectory: '/Documents');

    if (selectedDirectory == null) {
      return emit(const BackupState.fail("Export canceled"));
    }

    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final file = File('$selectedDirectory/timer_backup_$timestamp.json');

    final json = repo.exportJson();
    final jsonstr = jsonEncode(json);
    file.writeAsString(jsonstr);
    log(jsonstr);
    emit(const BackupState.success("exporting success"));
  }

  Future<void> import() async {
    final filePicker =
        await FilePicker.platform.pickFiles(initialDirectory: '/Documents');

    final path = filePicker?.files.single.path;

    if (path != null) {
      try {
        final file = File(path);
        final jsonstr = await file.readAsString();

        final json = (jsonDecode(jsonstr) as List).cast<Map<String, dynamic>>();
        await repo.importJson(json);
        emit(const BackupState.success("importing success"));
      } on Exception catch (_) {
        emit(const BackupState.fail("error importing"));
      }
    } else {
      emit(const BackupState.fail("Cannot open file system."));
    }
  }
}
