import 'package:chill_market/core/Service/HiveService/hive_service.dart';
import 'package:chill_market/features/profile/data/model/settings_model.dart';

class SettingsDatasource {
  final HiveService hiveService;

  SettingsDatasource({required this.hiveService});

  Future<void> editSetting(SettingsModel settings) async {
    final hiveBox = hiveService.getBox<SettingsModel>('profile');
    await hiveBox.put('settings', settings);
  }

  Future<SettingsModel> getSettings() async {
    final hiveBox = hiveService.getBox<SettingsModel>('profile');
    final SettingsModel settings =
        hiveBox.get('settings') ?? SettingsModel.defaults();
    return settings;
  }
}
