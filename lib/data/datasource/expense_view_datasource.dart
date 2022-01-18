// ignore_for_file: file_names


import 'package:expense_clean_code/data/datasource/sqflite_instance.dart';

import 'package:expense_clean_code/data/model/expense_view_model.dart';

abstract class IExpenseViewDataSource {
  Future<List<ExpenseViewModel>> readExpense();
  Future<List<ExpenseViewModel>> readExpensebyDate(
      DateTime startdate, DateTime enddate);
  Future<double> readSumExpensebyDate(
      DateTime startdate, DateTime enddate);
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
  @override
  Future<List<ExpenseViewModel>> readExpensebyDate(
      DateTime startdate, DateTime enddate) async {
    var fromDate = startdate.toIso8601String();
    var toDate = enddate.toIso8601String();

    final db = await SqfliteInstance.instance.database;
    var sql =
        """SELECT * FROM v_expense WHERE ${ExpenseViewModel.columnDatetime} 
 BETWEEN '$fromDate' AND '$toDate' """;
    var json = await db.rawQuery(sql);
    List<ExpenseViewModel> list = [];
    for (var x in json) {
      list.add(ExpenseViewModel.fromMap(x));
    }
    return list;
  }
    @override
  Future<double> readSumExpensebyDate(
      DateTime startdate, DateTime enddate) async {
    var fromDate = startdate.toIso8601String();
    var toDate = enddate.toIso8601String();

    final db = await SqfliteInstance.instance.database;
    var sql =
        """SELECT SUM(${ExpenseViewModel.columnAmount}) FROM v_expense WHERE ${ExpenseViewModel.columnDatetime} 
 BETWEEN '$fromDate' AND '$toDate' """;
    var json = await db.rawQuery(sql);
   double value = double.tryParse(json[0]["SUM(${ExpenseViewModel.columnAmount})"].toString()) ?? 0 ;
    return value;
  }
}
