// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:expense_clean_code/data/model/expense_model.dart';

import 'package:expense_clean_code/domain/usecase/category_item_usecase.dart';
import 'package:expense_clean_code/domain/usecase/expense_usecase.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ExpenseController extends GetxController {
  final GetAllCategoryItemUseCase? getAllCategoryItemUseCase;
  final AddExpenseUseCase? addExpenseUseCase;
  final UpdateExpenseUseCase? updateExpenseUseCase;
  final DeleteExpenseUseCase? deleteExpenseUseCase;
  final GetExpenseByIdUseCase? getExpenseByIdUseCase;
  var blankcategory = ExpenseModel(
    amount: '',
    categoryId: 0,
    date: "",
  );
  var selectedColor = Rx<Color>(Colors.white);
  late ExpenseModel selectedCategory;
  var listCategoryItem = RxList<ExpenseModel>();
  var isLoading = false.obs;

  ExpenseController(
      {this.getAllCategoryItemUseCase,
      this.addExpenseUseCase,
      this.updateExpenseUseCase,
      this.deleteExpenseUseCase,
      this.getExpenseByIdUseCase});

  @override
  void onInit() {
    super.onInit();
  }

  loadData() async {
    isLoading.value = true;
    // selectedCategory = blankcategory;
    listCategoryItem.clear();
    // final CategoryController categoryController = Get.find();
    // var list = await getExpenseByIdUseCase!
    //     .call(categoryController.selectedCategory.id!);
    // listCategoryItem.assignAll(list);
    isLoading.value = false;
  }

  editCategoryItem(ExpenseModel model) {
    selectedCategory = model;
  }

  selectCategoryItem(ExpenseModel model) {
    selectedCategory = model;
    listCategoryItem.refresh();
  }

  selectColor(Color color) {
    selectedColor.value = color;
    selectedColor.refresh();
  }

  Future<int> saveData(ExpenseModel model) async {
    var recordId = await addExpenseUseCase!.call(model);

    listCategoryItem.add(model.copyWith(
      id: recordId,
    ));

    return recordId;
  }

  Future<int> updateData(ExpenseModel model) async {
    var recordId = await updateExpenseUseCase!.call(model);

    var id = listCategoryItem.indexWhere((x) => x.id == model.id);
    listCategoryItem[id] = model;

    return recordId;
  }

  Future<int> deleteData(int recordId) async {
    var id = await deleteExpenseUseCase!.call(recordId);

    listCategoryItem.removeWhere((x) => x.id == recordId);

    return id;
  }
}
