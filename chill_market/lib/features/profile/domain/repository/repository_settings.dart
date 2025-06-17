import 'package:chill_market/features/profile/domain/entity/settings.dart';

abstract class SettingsRepository {
  Future<void> editSettings(Settings settings);
  Future<Settings> getSettings();
}
