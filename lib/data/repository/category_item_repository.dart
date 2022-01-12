import 'package:expense_clean_code/data/datasource/category_item_datasource.dart';
import 'package:expense_clean_code/data/model/category_item_model.dart';

import 'package:expense_clean_code/domain/repository/category_item_interface_repository.dart';

class CategoryItemRepository extends ICategoryItemRepository {
  final ICategoryItemDataSource? iCategoryItemDataSource;

  CategoryItemRepository({this.iCategoryItemDataSource});

  @override
  Future<List<CategoryItemModel>> getAllCategoryItem() async {
    List<CategoryItemModel> listCategory =
        await iCategoryItemDataSource!.readCategoryItem();
    return listCategory;
  }

  @override
  Future<int> addCategoryItem(CategoryItemModel model) {
    var id = iCategoryItemDataSource!.createCategoryItem(model);
    return id;
  }

  @override
  Future<int> deleteCategoryItem(int recordId) async {
    var id = await iCategoryItemDataSource!.deleteCategoryItem(recordId);
    return id;
  }

  @override
  Future<int> updateCategoryItem(CategoryItemModel model) async {
    var id = await iCategoryItemDataSource!.updateCategoryItem(model);
    return id;
  }

  @override
  Future<List<CategoryItemModel>> getAllCategoryItemByCategoryId(
      int recordId) async {
    List<CategoryItemModel> listCategoryItemByID =
        await iCategoryItemDataSource!.readCategoryItemByCategoryId(recordId);
    return listCategoryItemByID;
  }
}
