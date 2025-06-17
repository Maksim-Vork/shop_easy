import 'package:chill_market/features/profile/domain/entity/settings.dart';

abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class ProfileSettingsSatet extends SettingsState {
  final Settings settings;

  ProfileSettingsSatet({required this.settings});
}

class SettingsError extends SettingsState {
  final String error;

  SettingsError({required this.error});
}
