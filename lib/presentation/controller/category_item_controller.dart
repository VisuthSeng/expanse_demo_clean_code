// import 'package:get/get_state_manager/get_state_manager.dart';

// class CategoryItemController extends GetxController {}
// // ignore_for_file: unnecessary_overrides



// class CategoryController extends GetxController {
//   final GetAllCategoryUseCase? getAllCategoryUseCase;
//   final AddCategoryUseCase? addCategoryUseCase;
//   var blankcategory = CategoryModel(
//     name: '',
//   );
//   late CategoryModel selectedCategory;
//   var listCategory = RxList<CategoryModel>();
//   var isLoading = false.obs;
//   CategoryController({
//     this.getAllCategoryUseCase,
//     this.addCategoryUseCase,
//   });

//   @override
//   void onInit() {
//     loadData();
//     super.onInit();
//   }

//   loadData() async {
//     isLoading.value = true;
//     selectedCategory = blankcategory;
//     listCategory.clear();
//     var list = await getAllCategoryUseCase!.call(NoParam());
//     listCategory.assignAll(list);
//     isLoading.value = false;
//   }

//   selectCategory(CategoryModel model) {
//     selectedCategory = model;
//     listCategory.refresh();
//   }

//   Future<int> saveData(CategoryModel model) async {
//     var recordId = await addCategoryUseCase!.call(model);

//     listCategory.add(model.copyWith(id: recordId));

//     return recordId;
//   }
// }
