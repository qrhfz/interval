import 'package:bloc/bloc.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interval/data/preset_repo.dart';
import 'package:interval/di.dart';

import '../../../domain/entitites/preset.dart';

part 'preset_state.dart';
part 'preset_cubit.freezed.dart';

class PresetCubit extends Cubit<PresetState> {
  PresetCubit() : super(const PresetState.initial());

  final PresetRepo repo = getIt.get();

  void fetchData() {
    final list = repo.getAllPreset();

    emit(PresetState.data(list));
  }
}
