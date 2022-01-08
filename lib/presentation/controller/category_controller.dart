// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:expense_clean_code/data/model/category_model.dart';
import 'package:expense_clean_code/domain/entity/no_param.dart';
import 'package:expense_clean_code/domain/usecase/category_usecase.dart';

import 'package:get/get.dart';

class CategoryController extends GetxController {
  final GetAllCategoryUseCase? getAllCategoryUseCase;
  final AddCategoryUseCase? addCategoryUseCase;
  final UpdateCategoryUseCase? updateCategoryUsecase;
  final DeleteCategoryUseCase? deleteCategoryUseCase;
  var blankcategory = CategoryModel(
    name: '',
  );

  late CategoryModel selectedCategory;
  var listCategory = RxList<CategoryModel>();
  var isLoading = false.obs;
  CategoryController({
    this.updateCategoryUsecase,
    this.getAllCategoryUseCase,
    this.addCategoryUseCase,
    this.deleteCategoryUseCase,
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

  editCategory(CategoryModel model) {
    selectedCategory = model;
  }

  selectCategory(CategoryModel model) {
    selectedCategory = model;
    listCategory.refresh();
  }

  Future<int> saveData(CategoryModel model) async {
    var recordId = await addCategoryUseCase!.call(model);

    listCategory.add(model.copyWith(
      id: recordId,
      color: model.color!,
      col: model.col,
    ));

    return recordId;
  }

  Future<int> updateData(CategoryModel model) async {
    var recordId = await updateCategoryUsecase!.call(model);

    var id = listCategory.indexWhere((x) => x.id == model.id);
    listCategory[id] = model;

    return recordId;
  }

  Future<int> deleteData(int recordId) async {
    var id = await deleteCategoryUseCase!.call(recordId);

    listCategory.removeWhere((x) => x.id == recordId);

    return id;
  }
}
