import 'package:get_it/get_it.dart';
import 'package:interval/data/preset_db.dart';
import 'package:interval/data/preset_repo.dart';

import 'app/interval/timer_auido_controller.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<PresetDB>(PresetDB());
  getIt.registerSingleton(PresetRepo(getIt.get<PresetDB>()));
  getIt.registerSingleton(TimerAudioController());
}
