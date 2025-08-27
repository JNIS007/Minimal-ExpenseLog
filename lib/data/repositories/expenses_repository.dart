
import 'package:drift/drift.dart';

import '../../domain/entities/expense.dart';
import '../../domain/repositories/i_expense_repository.dart';
import '../data_source/local/app_database.dart';

class ExpensesRepository implements IExpensesRepository {
  final AppDatabase db;

  ExpensesRepository(this.db);

  @override
  Future<int> addExpense(ExpenseDataEnt expense) async {
    return await db.into(db.expenses).insert(expense.toCompanion());
  }

  @override
  Future<List<ExpenseDataEnt>> getAllExpenses() async {
    final rows = await db.select(db.expenses).get();
    return rows.map(ExpenseDataEnt.fromRow).toList();
  }

  @override
  Future<ExpenseDataEnt?> getExpenseById(int id) async {
    final row = await (db.select(db.expenses)
      ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();

    return row == null ? null : ExpenseDataEnt.fromRow(row);
  }

  @override
  Future<void> deleteExpense(int id) async {
    await (db.delete(db.expenses)..where((tbl) => tbl.id.equals(id))).go();
  }

  @override
  Future<void> updateExpense(ExpenseDataEnt expense) async {
    await (db.update(db.expenses)..where((tbl) => tbl.id.equals(expense.id)))
        .write(expense.toCompanion(includeId: false));
  }

  @override
  Future<int> getExpenseCountByCategory(String category) async {
    final query = db.selectOnly(db.expenses)
      ..addColumns([db.expenses.id.count()])
      ..where(db.expenses.category.equals(category));

    final result =
    await query.map((row) => row.read(db.expenses.id.count())).getSingle();
    return result ?? 0;
  }
}
