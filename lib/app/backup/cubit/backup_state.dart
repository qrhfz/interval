part of 'backup_cubit.dart';

@freezed
class BackupState with _$BackupState {
  const factory BackupState.initial() = _Initial;
  const factory BackupState.fail(String message) = _Fail;
  const factory BackupState.success(String message) = _Success;
}
