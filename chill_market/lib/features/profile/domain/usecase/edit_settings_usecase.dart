import 'package:chill_market/features/profile/domain/entity/settings.dart';
import 'package:chill_market/features/profile/domain/repository/repository_settings.dart';

class EditSettingsUsecase {
  final SettingsRepository settingsRepository;

  EditSettingsUsecase({required this.settingsRepository});

  Future<void> call(Settings settings) async {
    await settingsRepository.editSettings(settings);
  }
}
