// ignore_for_file: file_names

import 'package:expense_clean_code/data/model/expense_model.dart';

abstract class IExpenseRepository {
  Future<List<ExpenseModel>> getAllExpense();
  Future<List<ExpenseModel>> getAllExpenseByCategoryId(int recordId);
  Future<int> addExpense(ExpenseModel model);
  Future<int> updateExpense(ExpenseModel model);
  Future<int> deleteExpense(int recordId);
}
// a