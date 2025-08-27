

import 'package:drift/drift.dart';
import 'package:expenselog/domain/entities/settings.dart';

import '../../data/data_source/local/app_database.dart';

class ExpenseDataEnt {

  final int id;
  final String title;
  final double amount;
  final String category;
  final DateTime date;
  final String? note;


  ExpenseDataEnt({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    this.note,
  });


  factory ExpenseDataEnt.fromRow(Expense row) {
    return ExpenseDataEnt(
        id: row.id,
        title: row.title,
        amount: row.amount,
        category: row.category,
        date: row.date,
        note: row.note
    );
  }
  // Method to convert the ExpenseData object into a Drift companion.
  ExpensesCompanion toCompanion({bool includeId = false}) {
    return ExpensesCompanion(
      id: includeId ? Value(id) : const Value.absent(),
      title: Value(title),
      amount: Value(amount),
      category: Value(category),
      date: Value(date),
      note: Value(note),
    );
  }




}