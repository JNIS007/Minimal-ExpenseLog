

import 'package:drift/drift.dart';

import '../../data/data_source/local/app_database.dart';

class SettingsDataEnt {
  final int id;
  final String theme;

  SettingsDataEnt({
    required this.id,
    required this.theme,
  });

  // Factory method to map from Drift row to SettingsDataEnt
  factory SettingsDataEnt.fromRow(Setting row) {
   return SettingsDataEnt(
       id: row.id,
       theme: row.theme
   );
  }

  // Method to convert SettingsDataEnt to Drift Companion for inserts and updates
  SettingsCompanion toCompanion({bool includeId = false}) {
    return SettingsCompanion(
      id: includeId ? Value(id) : const Value.absent(),
      theme: Value(theme),
    );
  }

  SettingsDataEnt copyWith ({
    int ? id,
    String ? theme
  }) {
    return SettingsDataEnt(
        id: id ?? this.id,
        theme: theme ?? this.theme
    );
  }
}