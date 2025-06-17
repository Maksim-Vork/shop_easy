import 'package:chill_market/features/profile/domain/entity/settings.dart';
import 'package:hive/hive.dart';
part 'settings_model.g.dart';

@HiveType(typeId: 2)
class SettingsModel {
  @HiveField(0)
  final bool isDart;
  @HiveField(1)
  final String language;
  @HiveField(2)
  final String currency;

  SettingsModel({
    required this.isDart,
    required this.language,
    required this.currency,
  });

  static SettingsModel defaults() =>
      SettingsModel(isDart: true, language: 'ry', currency: 'byn');

  factory SettingsModel.fromEntity(Settings settings) {
    return SettingsModel(
      isDart: settings.isDart,
      language: settings.language,
      currency: settings.currency,
    );
  }
  Settings toEntity() {
    return Settings(isDart: isDart, language: language, currency: currency);
  }
}
