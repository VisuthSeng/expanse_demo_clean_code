import 'package:expense_clean_code/data/model/expense_model.dart';

import 'package:expense_clean_code/domain/entity/no_param.dart';

import 'package:expense_clean_code/domain/repository/expense_item_interface_repository.dart';

import 'package:expense_clean_code/domain/usecase/usecase.dart';

class GetAllExpenseUseCase extends UseCaseFuture<List<ExpenseModel>, NoParam> {
  final IExpenseRepository? expenseRepository;

  GetAllExpenseUseCase({this.expenseRepository});

  @override
  Future<List<ExpenseModel>> call(NoParam params) async {
    List<ExpenseModel> listProduct = await expenseRepository!.getAllExpense();
    return listProduct;
  }
}

class AddExpenseUseCase extends UseCaseFuture<int, ExpenseModel> {
  final IExpenseRepository? expenseRepository;

  AddExpenseUseCase({this.expenseRepository});

  @override
  Future<int> call(ExpenseModel params) async {
    var id = await expenseRepository!.addExpense(params);
    return id;
  }
}

class UpdateExpenseUseCase extends UseCaseFuture<int, ExpenseModel> {
  final IExpenseRepository? expenseRepository;

  UpdateExpenseUseCase({this.expenseRepository});

  @override
  Future<int> call(ExpenseModel params) async {
    var id = await expenseRepository!.updateExpense(params);
    return id;
  }
}

class DeleteExpenseUseCase extends UseCaseFuture<int, int> {
  final IExpenseRepository? expenseRepository;

  DeleteExpenseUseCase({this.expenseRepository});

  @override
  Future<int> call(int params) async {
    var id = await expenseRepository!.deleteExpense(params);
    return id;
  }
}

class GetExpenseByIdUseCase extends UseCaseFuture<List<ExpenseModel>, int> {
  final IExpenseRepository? expenseRepository;

  GetExpenseByIdUseCase({this.expenseRepository});

  @override
  Future<List<ExpenseModel>> call(int params) async {
    List<ExpenseModel> listcategory =
        await expenseRepository!.getAllExpenseByCategoryId(params);
    return listcategory;
  }
}
