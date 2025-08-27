
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
part 'app_database.g.dart';

class Expenses extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  RealColumn get amount => real()();
  TextColumn get category => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get note => text().nullable()();
}

class Settings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get theme => text().check(theme.isIn(['light', 'dark'])).withDefault(const Constant('light'))();

}

@DriftDatabase(tables: [Expenses, Settings])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'expense_tracker.db'));
    return NativeDatabase.createInBackground(file);
  });
}


