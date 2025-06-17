import 'package:chill_market/features/profile/data/datasource/settings_datasource.dart';
import 'package:chill_market/features/profile/data/model/settings_model.dart';
import 'package:chill_market/features/profile/domain/entity/settings.dart';
import 'package:chill_market/features/profile/domain/repository/repository_settings.dart';

class Settingsrepositoryimpl extends SettingsRepository {
  final SettingsDatasource settingsDatasource;

  Settingsrepositoryimpl({required this.settingsDatasource});
  @override
  Future<void> editSettings(Settings settings) async {
    final SettingsModel settingsModel = SettingsModel.fromEntity(settings);
    await settingsDatasource.editSetting(settingsModel);
  }

  @override
  Future<Settings> getSettings() async {
    final SettingsModel listSettingModel =
        await settingsDatasource.getSettings();
    final Settings listSetting = listSettingModel.toEntity();
    return listSetting;
  }
}
