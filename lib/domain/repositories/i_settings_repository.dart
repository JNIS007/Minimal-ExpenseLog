



import '../entities/settings.dart';

abstract class ISettingsRepository {
  // Fetch the current settings
  Future<SettingsDataEnt> getSettings();

  // Change the theme (light or dark)
  Future<void> changeTheme(String theme);

  // Update settings with a SettingsDataEnt object
  Future<void> updateSettings(SettingsDataEnt settings);
}