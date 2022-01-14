import 'package:expense_clean_code/data/datasource/expense_datasource.dart';

import 'package:expense_clean_code/data/model/expense_model.dart';
import 'package:expense_clean_code/domain/repository/expense_item_interface_repository.dart';

class ExpenseRepository extends IExpenseRepository {
  final IExpenseDataSource? expenseDataSource;

  ExpenseRepository({this.expenseDataSource});

  @override
  Future<List<ExpenseModel>> getAllExpense() async {
    List<ExpenseModel> listexpense = await expenseDataSource!.readExpense();
    return listexpense;
  }

  @override
  Future<int> addExpense(ExpenseModel model) {
    var id = expenseDataSource!.createExpense(model);
    return id;
  }

  @override
  Future<int> deleteExpense(int recordId) async {
    var id = await expenseDataSource!.deleteExpense(recordId);
    return id;
  }

  @override
  Future<int> updateExpense(ExpenseModel model) async {
    var id = await expenseDataSource!.updateExpense(model);
    return id;
  }

  @override
  Future<List<ExpenseModel>> getAllExpenseByCategoryId(int recordId) async {
    List<ExpenseModel> listExpensebyCategoryID =
        await expenseDataSource!.readExpense();
    return listExpensebyCategoryID;
  }
}
