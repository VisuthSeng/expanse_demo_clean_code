// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:expense_clean_code/data/model/category_item_model.dart';

import 'package:expense_clean_code/domain/usecase/category_item_usecase.dart';
import 'package:expense_clean_code/presentation/controller/category_controller.dart';

import 'package:get/get.dart';

class CategoryItemController extends GetxController {
  final GetAllCategoryItemUseCase? getAllCategoryItemUseCase;
  final AddCategoryItemUseCase? addCategoryItemUseCase;
  final UpdateCategoryItemUseCase? updateCategoryItemUsecase;
  final DeleteCategoryItemUseCase? deleteCategoryItemUseCase;
  final GetCategoryItemByIdUseCase? getCategoryItemByIdUseCase;
  var blankcategory = CategoryItemModel(
    name: '',
    categoryId: 0,
  );

  late CategoryItemModel selectedCategory;
  var listCategoryItem = RxList<CategoryItemModel>();
  var isLoading = false.obs;
  CategoryItemController({
    this.updateCategoryItemUsecase,
    this.getAllCategoryItemUseCase,
    this.getCategoryItemByIdUseCase,
    this.addCategoryItemUseCase,
    this.deleteCategoryItemUseCase,
  });

  @override
  void onInit() {
    super.onInit();
  }

  loadData() async {
    isLoading.value = true;
    selectedCategory = blankcategory;
    listCategoryItem.clear();
    final CategoryController categoryController = Get.find();
    var list = await getCategoryItemByIdUseCase!
        .call(categoryController.selectedCategory.id!);
    listCategoryItem.assignAll(list);
    isLoading.value = false;
  }

  editCategoryItem(CategoryItemModel model) {
    selectedCategory = model;
  }

  selectCategoryItem(CategoryItemModel model) {
    selectedCategory = model;
    listCategoryItem.refresh();
  }

  Future<int> saveData(CategoryItemModel model) async {
    var recordId = await addCategoryItemUseCase!.call(model);

    listCategoryItem.add(model.copyWith(
      id: recordId,
    ));

    return recordId;
  }

  Future<int> updateData(CategoryItemModel model) async {
    var recordId = await updateCategoryItemUsecase!.call(model);

    var id = listCategoryItem.indexWhere((x) => x.id == model.id);
    listCategoryItem[id] = model;

    return recordId;
  }

  Future<int> deleteData(int recordId) async {
    var id = await deleteCategoryItemUseCase!.call(recordId);

    listCategoryItem.removeWhere((x) => x.id == recordId);

    return id;
  }
}
