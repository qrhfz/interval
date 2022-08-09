part of 'preset_cubit.dart';

@freezed
class PresetState with _$PresetState {
  const factory PresetState.initial() = _Initial;
  const factory PresetState.data(IList<Preset> presets) = _Data;
}
