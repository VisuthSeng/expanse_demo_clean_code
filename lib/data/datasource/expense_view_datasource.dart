// ignore_for_file: file_names

import 'package:expense_clean_code/data/datasource/sqflite_instance.dart';

import 'package:expense_clean_code/data/model/expense_view_model.dart';

abstract class IExpenseViewDataSource {
  Future<List<ExpenseViewModel>> readExpense();
  // Future<List<ExpenseViewModel>> readExpensebyDate(DateTime startdate,DateTime enddate);
}

class ExpenseViewDataSource extends IExpenseViewDataSource {
  @override
  Future<List<ExpenseViewModel>> readExpense() async {
    var json = await SqfliteInstance.instance
        .read(tableName: ExpenseViewModel.viewName);
    List<ExpenseViewModel> list = [];
    for (var x in json) {
      list.add(ExpenseViewModel.fromMap(x));
    }
    return list;
  }

  // @override
  // Future<List<ExpenseViewModel>> readExpensebyDate() {
  //   return 1;
  // }
}
