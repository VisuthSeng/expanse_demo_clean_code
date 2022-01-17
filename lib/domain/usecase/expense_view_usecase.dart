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
