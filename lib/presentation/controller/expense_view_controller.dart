// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:expense_clean_code/data/datasource/pick_date_datasource.dart';
import 'package:expense_clean_code/data/model/expense_view_model.dart';
import 'package:expense_clean_code/data/model/pick_date_model.dart';
import 'package:expense_clean_code/domain/entity/no_param.dart';
import 'package:expense_clean_code/domain/usecase/expense_view_usecase.dart';

import 'package:get/get.dart';

class ExpenseViewController extends GetxController {
  final GetAllExpenseViewUseCase? getAllExpenseViewUseCase;
  final GetAllExpenseViewByDateUseCase? getAllExpenseViewByDateUseCase;
  final GetAllSumExpenseByDateUseCase? getAllSumExpenseByDateUseCase;

  var blankviewexpense = ExpenseViewModel(
    amount: '',
    categoryId: 0,
    note: "",
    dateTime: DateTime.now(),
    categoryName: '',
  );

  late ExpenseViewModel selectedExpensed;
  var listexpenseView = RxList<ExpenseViewModel>();
  var listexpenseViewbyDate = RxList<ExpenseViewModel>();
  var listtoday = RxList<PickDateModel>();
  var isLoading = false.obs;
  var totalmonth = 0.0.obs;
  var totaltoday = 0.0.obs;

  ExpenseViewController({
    this.getAllExpenseViewUseCase,
    this.getAllExpenseViewByDateUseCase,
    this.getAllSumExpenseByDateUseCase,
  });

  @override
  void onInit() {
    selectedExpensed = blankviewexpense;

    loadData();
    dayData();

    getDashBoardExpense();
    super.onInit();
  }

  loadData() async {
    isLoading.value = true;
    var list = await getAllExpenseViewUseCase!.call(NoParam());
    listexpenseView.assignAll(list);
    isLoading.value = false;
  }

  dayData() async {
    var list = await PickDateDataSource.listPickDate();
    listtoday.assignAll(list);
  }

  getexpensebyDate(DateTime startdate, DateTime enddate) async {
    var list = await getAllExpenseViewByDateUseCase!.call(startdate, enddate);
    listexpenseViewbyDate.assignAll(list);
  }

  getDashBoardExpense() async {
    var startDate = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 1);
    var endDate = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, 23, 59, 59);
    totaltoday.value =
        await getAllSumExpenseByDateUseCase!.call(startDate, endDate);

    startDate = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 1);
    endDate = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, 23, 59, 59);
    totalmonth.value =
        await getAllSumExpenseByDateUseCase!.call(startDate, endDate);
  }
}
