// ignore_for_file: file_names

import 'package:expense_clean_code/data/model/category_model.dart';

abstract class ICategoryRepository {
  Future<List<CategoryModel>> getAllCategory();
  Future<int> addCategory(CategoryModel model);
}
