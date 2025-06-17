import 'package:chill_market/features/profile/domain/entity/settings.dart';
import 'package:chill_market/features/profile/domain/repository/repository_settings.dart';

class GetSettingsUsecase {
  final SettingsRepository settingsRepository;

  GetSettingsUsecase({required this.settingsRepository});

  Future<Settings> call() async {
    final Settings listSetting = await settingsRepository.getSettings();
    return listSetting;
  }
}
