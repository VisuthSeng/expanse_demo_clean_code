// ignore_for_file: file_names

import 'package:expense_clean_code/data/datasource/sqflite_instance.dart';

import 'package:expense_clean_code/data/model/expense_model.dart';

abstract class IExpenseDataSource {
  Future<int> createExpense(ExpenseModel model);
  Future<int> updateExpense(ExpenseModel model);
  Future<int> deleteExpense(int recordId);
  Future<List<ExpenseModel>> readExpense();
}

class ExpenseDataSource extends IExpenseDataSource {
  @override
  Future<int> createExpense(ExpenseModel model) async {
    var id = await SqfliteInstance.instance
        .create(map: model.toMap(), tableName: ExpenseModel.tableName);
    return id;
  }

  @override
  Future<int> updateExpense(ExpenseModel model) async {
    var id = await SqfliteInstance.instance
        .update(map: model.toMap(), tableName: ExpenseModel.tableName);
    return id;
  }

  @override
  Future<List<ExpenseModel>> readExpense() async {
    var json =
        await SqfliteInstance.instance.read(tableName: ExpenseModel.tableName);
    List<ExpenseModel> list = [];
    for (var x in json) {
      list.add(ExpenseModel.fromMap(x));
    }
    return list;
  }

  @override
  Future<int> deleteExpense(int recordId) async {
    var id = await SqfliteInstance.instance
        .delete(tableName: ExpenseModel.tableName, id: recordId);
    return id;
  }
}
