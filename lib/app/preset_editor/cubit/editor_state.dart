part of 'editor_cubit.dart';

@freezed
class EditorState with _$EditorState {
  const factory EditorState.initial() = _Initial;
  const factory EditorState.data(int? key, Preset preset) = _Data;
  const factory EditorState.save() = _Save;
}
