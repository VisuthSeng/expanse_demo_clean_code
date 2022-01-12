import 'package:expense_clean_code/data/model/category_item_model.dart';

import 'package:expense_clean_code/domain/entity/no_param.dart';

import 'package:expense_clean_code/domain/repository/category_item_interface_repository.dart';

import 'package:expense_clean_code/domain/usecase/usecase.dart';

class GetAllCategoryItemUseCase
    extends UseCaseFuture<List<CategoryItemModel>, NoParam> {
  final ICategoryItemRepository? iCategoryItemRepository;

  GetAllCategoryItemUseCase({this.iCategoryItemRepository});

  @override
  Future<List<CategoryItemModel>> call(NoParam params) async {
    List<CategoryItemModel> listProduct =
        await iCategoryItemRepository!.getAllCategoryItem();
    return listProduct;
  }
}

class GetCategoryItemByIdUseCase
    extends UseCaseFuture<List<CategoryItemModel>, int> {
  final ICategoryItemRepository? iCategoryItemRepository;

  GetCategoryItemByIdUseCase({this.iCategoryItemRepository});

  @override
  Future<List<CategoryItemModel>> call(int params) async {
    List<CategoryItemModel> listcategory =
        await iCategoryItemRepository!.getAllCategoryItemByCategoryId(params);
    return listcategory;
  }
}

class AddCategoryItemUseCase extends UseCaseFuture<int, CategoryItemModel> {
  final ICategoryItemRepository? iCategoryItemRepository;

  AddCategoryItemUseCase({this.iCategoryItemRepository});

  @override
  Future<int> call(CategoryItemModel params) async {
    var id = await iCategoryItemRepository!.addCategoryItem(params);
    return id;
  }
}

class UpdateCategoryItemUseCase extends UseCaseFuture<int, CategoryItemModel> {
  final ICategoryItemRepository? iCategoryItemRepository;

  UpdateCategoryItemUseCase({this.iCategoryItemRepository});

  @override
  Future<int> call(CategoryItemModel params) async {
    var id = await iCategoryItemRepository!.updateCategoryItem(params);
    return id;
  }
}

class DeleteCategoryItemUseCase extends UseCaseFuture<int, int> {
  final ICategoryItemRepository? iCategoryItemRepository;

  DeleteCategoryItemUseCase({this.iCategoryItemRepository});

  @override
  Future<int> call(int params) async {
    var id = await iCategoryItemRepository!.deleteCategoryItem(params);
    return id;
  }
}
