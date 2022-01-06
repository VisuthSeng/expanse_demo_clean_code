import 'package:expense_clean_code/data/datasource/category_datasource.dart';
import 'package:expense_clean_code/data/model/category_model.dart';
import 'package:expense_clean_code/domain/repository/category_interface_repository.dart';

class CategoryRepository extends ICategoryRepository {
  final ICategoryDataSource? iCategoryDataSource;

  CategoryRepository({this.iCategoryDataSource});

  @override
  Future<List<CategoryModel>> getAllCategory() async {
    List<CategoryModel> listCategory =
        await iCategoryDataSource!.readCategory();
    return listCategory;
  }

  @override
  Future<int> addCategory(CategoryModel model) {
    var id = iCategoryDataSource!.createCategory(model);
    return id;
  }

  @override
  Future<int> deleteCategory(int recordId) async {
    var id = await iCategoryDataSource!.deleteCategory(recordId);
    return id;
  }

  @override
  Future<int> updateCategory(CategoryModel model) async {
    var id = await iCategoryDataSource!.updateCategory(model);
    return id;
  }
}
