import 'package:expense_clean_code/data/model/category_model.dart';
import 'package:expense_clean_code/domain/entity/no_param.dart';
import 'package:expense_clean_code/domain/repository/category_interface_repository.dart';

import 'package:expense_clean_code/domain/usecase/usecase.dart';

class GetAllCategoryUseCase
    extends UseCaseFuture<List<CategoryModel>, NoParam> {
  final ICategoryRepository? iCategoryRepository;

  GetAllCategoryUseCase({this.iCategoryRepository});

  @override
  Future<List<CategoryModel>> call(NoParam params) async {
    List<CategoryModel> listProduct =
        await iCategoryRepository!.getAllCategory();
    return listProduct;
  }
}

class AddCategoryUseCase extends UseCaseFuture<int, CategoryModel> {
  final ICategoryRepository? iCategoryRepository;

  AddCategoryUseCase({this.iCategoryRepository});

  @override
  Future<int> call(CategoryModel params) async {
    var id = await iCategoryRepository!.addCategory(params);
    return id;
  }
}
