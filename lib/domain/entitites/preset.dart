import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'loop.dart';

part 'preset.freezed.dart';

@freezed
class Preset with _$Preset {
  const Preset._();
  factory Preset({
    required String name,
    required IList<Loop> loops,
  }) = _Preset;

  Duration get totelDuration {
    return loops
        .map((element) => element.totelDuration)
        .reduce((value, element) => value + element);
  }
}
