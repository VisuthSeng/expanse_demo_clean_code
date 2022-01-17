// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:expense_clean_code/data/model/expense_model.dart';
import 'package:expense_clean_code/domain/entity/no_param.dart';
import 'package:expense_clean_code/domain/usecase/expense_usecase.dart';
import 'package:get/get.dart';

class ExpenseController extends GetxController {
  final GetAllExpenseUseCase? getAllExpenseUseCase;
  final AddExpenseUseCase? addExpenseUseCase;
  final UpdateExpenseUseCase? updateExpenseUseCase;
  final DeleteExpenseUseCase? deleteExpenseUseCase;
  final GetExpenseByIdUseCase? getExpenseByIdUseCase;
  var blankexpense = ExpenseModel(
    amount: '',
    categoryId: 0,
    note: "",
    dateTime: DateTime.now(),
    categoryItem: '',
  );

  late ExpenseModel selectedExpensed;
  var listexpense = RxList<ExpenseModel>();
  var isLoading = false.obs;

  ExpenseController(
      {this.getAllExpenseUseCase,
      this.addExpenseUseCase,
      this.updateExpenseUseCase,
      this.deleteExpenseUseCase,
      this.getExpenseByIdUseCase,
      getAllExpenseViewUseCase});

  @override
  void onInit() {
    selectedExpensed = blankexpense;
    loadData();
    super.onInit();
  }

  loadData() async {
    isLoading.value = true;
    var list = await getAllExpenseUseCase!.call(NoParam());
    listexpense.assignAll(list);
    isLoading.value = false;
  }

  Future<int> saveData(ExpenseModel model) async {
    var recordId = await addExpenseUseCase!.call(model);

    listexpense.add(model.copyWith(
      id: recordId,
      dateTime: DateTime.now(),
    ));
    return recordId;
  }

  Future<int> updateData(ExpenseModel model) async {
    var recordId = await updateExpenseUseCase!.call(model);
    var id = listexpense.indexWhere((x) => x.id == model.id);
    listexpense[id] = model;
    return recordId;
  }

  Future<int> deleteData(int recordId) async {
    var id = await deleteExpenseUseCase!.call(recordId);
    listexpense.removeWhere((x) => x.id == recordId);
    return id;
  }
}
