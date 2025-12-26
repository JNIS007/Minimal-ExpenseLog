import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expenselog/data/data_source/local/app_database.dart';
import 'package:expenselog/data/repositories/expenses_repository.dart';
import 'package:expenselog/domain/entities/expense.dart';
import 'package:expenselog/domain/repositories/i_expense_repository.dart';

// Database provider
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

// Repository provider
final expensesRepositoryProvider = Provider<IExpensesRepository>((ref) {
  final database = ref.watch(databaseProvider);
  return ExpensesRepository(database);
});

// Expenses list provider
final expensesProvider = StreamProvider<List<ExpenseDataEnt>>((ref) {
  final repository = ref.watch(expensesRepositoryProvider);
  // Convert Future to Stream for reactive updates
  return Stream.fromFuture(repository.getAllExpenses());
});

// Provider to add expense
final addExpenseProvider = Provider<Future<int> Function(ExpenseDataEnt)>((ref) {
  final repository = ref.watch(expensesRepositoryProvider);
  return (expense) => repository.addExpense(expense);
});

// Provider to delete expense
final deleteExpenseProvider = Provider<Future<void> Function(int)>((ref) {
  final repository = ref.watch(expensesRepositoryProvider);
  return (id) => repository.deleteExpense(id);
});

// Provider to update expense
final updateExpenseProvider = Provider<Future<void> Function(ExpenseDataEnt)>((ref) {
  final repository = ref.watch(expensesRepositoryProvider);
  return (expense) => repository.updateExpense(expense);
});
