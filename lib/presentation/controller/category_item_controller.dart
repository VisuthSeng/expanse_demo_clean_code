import 'package:expense_clean_code/data/model/category_item_model.dart';
import 'package:expense_clean_code/domain/entity/no_param.dart';
import 'package:expense_clean_code/domain/usecase/category_item_usecase.dart';
import 'package:get/get.dart';

// ignore_for_file: unnecessary_overrides

class CategoryItemController extends GetxController {
  final GetAllCategoryItemUseCase? getAllCategoryItemUseCase;
  final AddCategoryItemUseCase? addCategoryItemUseCase;
  final UpdateCategoryItemUseCase? updateCategoryItemUseCase;
  final DeleteCategoryItemUseCase? deleteCategoryItemUseCase;
  var blankcategory = CategoryItemModel(
    name: '',
  );
  late CategoryItemModel selectedCategory;
  var listCategory = RxList<CategoryItemModel>();
  var isLoading = false.obs;
  CategoryItemController({
    this.getAllCategoryItemUseCase,
    this.addCategoryItemUseCase,
    this.updateCategoryItemUseCase,
    this.deleteCategoryItemUseCase,
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
    var list = await getAllCategoryItemUseCase!.call(NoParam());
    listCategory.assignAll(list);
    isLoading.value = false;
  }

  selectCategory(CategoryItemModel model) {
    selectedCategory = model;
    listCategory.refresh();
  }

  Future<int> saveData(CategoryItemModel model) async {
    var recordId = await addCategoryItemUseCase!.call(model);

    listCategory.add(model.copyWith(id: recordId));

    return recordId;
  }

  Future<int> updateData(CategoryItemModel model) async {
    var recordId = await updateCategoryItemUseCase!.call(model);

    var id = listCategory.indexWhere((x) => x.id == model.id);
    listCategory[id] = model;

    return recordId;
  }

  Future<int> deleteData(int recordId) async {
    var id = await deleteCategoryItemUseCase!.call(recordId);

    listCategory.removeWhere((x) => x.id == recordId);

    return id;
  }
}
