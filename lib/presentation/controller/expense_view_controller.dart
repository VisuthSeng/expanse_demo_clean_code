// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:expense_clean_code/data/model/expense_view_model.dart';
import 'package:expense_clean_code/domain/entity/no_param.dart';
import 'package:expense_clean_code/domain/usecase/expense_view_usecase.dart';
import 'package:get/get.dart';

class ExpenseViewController extends GetxController {
  final GetAllExpenseViewUseCase? getAllExpenseViewUseCase;

  var blankviewexpense = ExpenseViewModel(
    amount: '',
    categoryId: 0,
    note: "",
    dateTime: DateTime.now(),
    categoryName: '',
  );

  late ExpenseViewModel selectedExpensed;
  var listexpenseView = RxList<ExpenseViewModel>();
  var isLoading = false.obs;

  ExpenseViewController({
    this.getAllExpenseViewUseCase,
  });

  @override
  void onInit() {
    selectedExpensed = blankviewexpense;
    loadData();
    super.onInit();
  }

  loadData() async {
    isLoading.value = true;
    var list = await getAllExpenseViewUseCase!.call(NoParam());
    listexpenseView.assignAll(list);
    isLoading.value = false;
  }
}
