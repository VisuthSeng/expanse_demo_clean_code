// ignore_for_file: file_names

import 'package:expense_clean_code/data/datasource/sqflite_instance.dart';
import 'package:expense_clean_code/data/model/category_model.dart';

abstract class ICategoryDataSource {
  Future<int> createCategory(CategoryModel model);
  Future<int> updateCategory(CategoryModel model);
  Future<int> deleteCategory(int recordId);
  Future<List<CategoryModel>> readCategory();
}

class CategoryDataSource extends ICategoryDataSource {
  @override
  Future<int> createCategory(CategoryModel model) async {
    var id = await SqfliteInstance.instance
        .create(map: model.toMap(), tableName: CategoryModel.tableName);
    return id;
  }

  @override
  Future<int> updateCategory(CategoryModel model) async {
    return 1;
    // var id = await SqfliteInstance.instance
    //     .update(map: model.toMap(), tableName: CustomerModel.tableName);
    // return id;
  }

  @override
  Future<List<CategoryModel>> readCategory() async {
    var json =
        await SqfliteInstance.instance.read(tableName: CategoryModel.tableName);
    List<CategoryModel> list = [];
    for (var x in json) {
      list.add(CategoryModel.fromMap(x));
    }
    return list;
  }

  @override
  Future<int> deleteCategory(int recordId) async {
    return 1;
    // Database db = await SqfliteInstance.instance.database;
    // int updateCount = await db.rawUpdate('''
    // UPDATE ${CustomerModel.tableName}
    // SET ${CustomerModel.columnActive} = ?
    // WHERE ${CustomerModel.columnId} = ?
    // ''', [0, recordId]);
    // return updateCount;
  }
}
