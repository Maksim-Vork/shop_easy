import 'package:chill_market/features/profile/domain/entity/settings.dart';

abstract class SettingsEvent {}

class EditSetting extends SettingsEvent {
  final Settings settings;

  EditSetting({required this.settings});
}

class GetSettings extends SettingsEvent {}
