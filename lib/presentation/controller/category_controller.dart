// ignore_for_file: unnecessary_overrides

import 'package:expense_clean_code/data/model/category_model.dart';
import 'package:expense_clean_code/domain/entity/no_param.dart';
import 'package:expense_clean_code/domain/usecase/category_usecase.dart';

import 'package:get/get.dart';

class CategoryController extends GetxController {
  final GetAllCategoryUseCase? getAllCategoryUseCase;
  final AddCategoryUseCase? addCategoryUseCase;
  var blankcategory = CategoryModel(
    name: '',
  );
  late CategoryModel selectedCategory;
  var listCategory = RxList<CategoryModel>();
  var isLoading = false.obs;
  CategoryController({
    this.getAllCategoryUseCase,
    this.addCategoryUseCase,
  });

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  loadData() async {
    isLoading.value = true;
    selectedCategory = blankcategory;
    listCategory.clear();
    var list = await getAllCategoryUseCase!.call(NoParam());
    listCategory.assignAll(list);
    isLoading.value = false;
  }

  selectCategory(CategoryModel model) {
    selectedCategory = model;
    listCategory.refresh();
  }

  Future<int> saveData(CategoryModel model) async {
    var recordId = await addCategoryUseCase!.call(model);

    listCategory.add(model.copyWith(id: recordId));

    return recordId;
  }
}
