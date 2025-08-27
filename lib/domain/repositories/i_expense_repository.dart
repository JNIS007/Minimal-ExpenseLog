



import '../entities/expense.dart';


abstract class IExpensesRepository {
  Future<int> addExpense(ExpenseDataEnt expense);
  Future<List<ExpenseDataEnt>> getAllExpenses();
  Future<ExpenseDataEnt?> getExpenseById(int id);
  Future<void> deleteExpense(int id);
  Future<void> updateExpense(ExpenseDataEnt expense);
  Future<int> getExpenseCountByCategory(String category);
}
