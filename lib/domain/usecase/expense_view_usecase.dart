import 'package:expense_clean_code/data/model/expense_view_model.dart';

import 'package:expense_clean_code/domain/entity/no_param.dart';

import 'package:expense_clean_code/domain/repository/expense_view_interface_repository.dart';

import 'package:expense_clean_code/domain/usecase/usecase.dart';

class GetAllExpenseViewUseCase
    extends UseCaseFuture<List<ExpenseViewModel>, NoParam> {
  final IExpenseViewRepository? expenseViewRepository;

  GetAllExpenseViewUseCase({this.expenseViewRepository});

  @override
  Future<List<ExpenseViewModel>> call(NoParam params) async {
    List<ExpenseViewModel> listProduct =
        await expenseViewRepository!.getAllExpense();
    return listProduct;
  }
}

class GetAllExpenseViewByDateUseCase
    extends UseCaseFutureTwoParam<List<ExpenseViewModel>, DateTime, DateTime> {
  final IExpenseViewRepository? expenseViewRepository;

  GetAllExpenseViewByDateUseCase({this.expenseViewRepository});

  @override
  Future<List<ExpenseViewModel>> call(DateTime param1, DateTime param2) async {
    List<ExpenseViewModel> listexpensebyDate =
        await expenseViewRepository!.getAllExpensebyDate(param1, param2);
    return listexpensebyDate;
  }
}

class GetAllSumExpenseByDateUseCase
    extends UseCaseFutureTwoParam<double, DateTime, DateTime> {
  final IExpenseViewRepository? expenseViewRepository;

  GetAllSumExpenseByDateUseCase({this.expenseViewRepository});

  @override
  Future<double> call(DateTime param1, DateTime param2) async {
    var totalexpensebyDate =
        await expenseViewRepository!.getSumExpenseToday(param1, param2);
    return totalexpensebyDate;
  }
}
