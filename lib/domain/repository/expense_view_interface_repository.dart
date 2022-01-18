// ignore_for_file: file_names

import 'package:expense_clean_code/data/model/expense_view_model.dart';

abstract class IExpenseViewRepository {
  Future<List<ExpenseViewModel>> getAllExpense();
  Future<List<ExpenseViewModel>> getAllExpensebyDate(
      DateTime startdate, DateTime enddate);
  Future<double> getSumExpenseToday(DateTime startdate, DateTime enddate);
}
// a