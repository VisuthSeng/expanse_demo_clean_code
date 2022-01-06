// ignore_for_file: file_names

import 'package:expense_clean_code/data/datasource/sqflite_instance.dart';
import 'package:expense_clean_code/data/model/category_item_model.dart';

abstract class ICategoryItemDataSource {
  Future<int> createCategoryItem(CategoryItemModel model);
  Future<int> updateCategoryItem(CategoryItemModel model);
  Future<int> deleteCategoryItem(int recordId);
  Future<List<CategoryItemModel>> readCategoryItem();
}

class CategoryItemDataSource extends ICategoryItemDataSource {
  @override
  Future<int> createCategoryItem(CategoryItemModel model) async {
    var id = await SqfliteInstance.instance
        .create(map: model.toMap(), tableName: CategoryItemModel.tableName);
    return id;
  }

  @override
  Future<int> updateCategoryItem(CategoryItemModel model) async {
    var id = await SqfliteInstance.instance
        .update(map: model.toMap(), tableName: CategoryItemModel.tableName);
    return id;
  }

  @override
  Future<List<CategoryItemModel>> readCategoryItem() async {
    var json = await SqfliteInstance.instance
        .read(tableName: CategoryItemModel.tableName);
    List<CategoryItemModel> list = [];
    for (var x in json) {
      list.add(CategoryItemModel.fromMap(x));
    }
    return list;
  }

  @override
  Future<int> deleteCategoryItem(int recordId) async {
    var id = await SqfliteInstance.instance
        .delete(tableName: CategoryItemModel.tableName, id: recordId);
    return id;
  }
}
