



import '../../domain/entities/settings.dart';
import '../../domain/repositories/i_settings_repository.dart';
import '../data_source/local/app_database.dart';

class SettingsRepository implements ISettingsRepository {
  final AppDatabase db;

  SettingsRepository(this.db);

  @override
  Future<SettingsDataEnt> getSettings() async {
    // Fetch the first setting from the Settings table (assuming only one row exists)
    final row = await db.select(db.settings).getSingleOrNull();

    // If no settings exist, create default settings (default theme is light)
    if (row == null) {
      final defaultSettings = SettingsDataEnt(id: 1, theme: 'light');
      await db.into(db.settings).insert(defaultSettings.toCompanion(includeId: true));
      return defaultSettings;
    }

    return SettingsDataEnt.fromRow(row);
  }

  @override
  Future<void> changeTheme(String theme) async {
    // Ensure the theme is either 'light' or 'dark'
    if (theme != 'light' && theme != 'dark') {
      throw ArgumentError('Invalid theme value');
    }

    // Update the theme in the settings table
    final currentSetting = await getSettings(); // Fetch current settings
    final updatedSettings = currentSetting.copyWith(theme: theme); // Create updated settings

    // Update the settings in the database
    await updateSettings(updatedSettings);
  }

  @override
  Future<void> updateSettings(SettingsDataEnt settings) async {
    await (db.update(db.settings)..where((tbl) => tbl.id.equals(settings.id)))
        .write(settings.toCompanion(includeId: false));
  }
}