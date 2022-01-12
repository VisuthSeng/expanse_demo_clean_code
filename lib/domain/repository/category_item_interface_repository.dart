// ignore_for_file: file_names

import 'package:expense_clean_code/data/model/category_item_model.dart';

abstract class ICategoryItemRepository {
  Future<List<CategoryItemModel>> getAllCategoryItem();
  Future<List<CategoryItemModel>> getAllCategoryItemByCategoryId(int recordId);
  Future<int> addCategoryItem(CategoryItemModel model);
  Future<int> updateCategoryItem(CategoryItemModel model);
  Future<int> deleteCategoryItem(int recordId);
}
// a