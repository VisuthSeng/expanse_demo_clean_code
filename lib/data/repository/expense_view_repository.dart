import 'package:expense_clean_code/data/datasource/expense_view_datasource.dart';

import 'package:expense_clean_code/data/model/expense_view_model.dart';

import 'package:expense_clean_code/domain/repository/expense_view_interface_repository.dart';

class ExpenseViewRepository extends IExpenseViewRepository {
  final IExpenseViewDataSource? expenseViewDataSource;

  ExpenseViewRepository({this.expenseViewDataSource});

  @override
  Future<List<ExpenseViewModel>> getAllExpense() async {
    List<ExpenseViewModel> listexpenseview =
        await expenseViewDataSource!.readExpense();
    return listexpenseview;
  }
}
