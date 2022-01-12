import 'package:expense_clean_code/data/datasource/category_datasource.dart';
import 'package:expense_clean_code/data/datasource/category_item_datasource.dart';
import 'package:expense_clean_code/data/repository/app_repository.dart';
import 'package:expense_clean_code/data/repository/category_item_repository.dart';
import 'package:expense_clean_code/data/repository/category_repository.dart';

import 'package:expense_clean_code/domain/repository/app_repository_interface.dart';
import 'package:expense_clean_code/domain/repository/category_interface_repository.dart';
import 'package:expense_clean_code/domain/repository/category_item_interface_repository.dart';

import 'package:expense_clean_code/domain/usecase/app_usecase.dart';
import 'package:expense_clean_code/domain/usecase/category_item_usecase.dart';
import 'package:expense_clean_code/domain/usecase/category_usecase.dart';

import 'package:expense_clean_code/presentation/controller/app_controller.dart';
import 'package:expense_clean_code/presentation/controller/category_controller.dart';
import 'package:expense_clean_code/presentation/controller/category_item_controller.dart';

import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IAppRepository?>(
      AppRepository(),
      permanent: true,
    );
    Get.put<CreateFolderUseCase?>(
      CreateFolderUseCase(appRepository: Get.find()),
      permanent: true,
    );
    Get.put<AppController>(
      AppController(createFolderUseCase: Get.find()),
      permanent: true,
    );
    Get.put<ICategoryDataSource?>(
      CategoryDataSource(),
      permanent: true,
    );
    Get.put<ICategoryRepository?>(
      CategoryRepository(iCategoryDataSource: Get.find()),
      permanent: true,
    );
    Get.put<GetAllCategoryUseCase?>(
      GetAllCategoryUseCase(
        iCategoryRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put<AddCategoryUseCase?>(
      AddCategoryUseCase(
        iCategoryRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put<UpdateCategoryUseCase?>(
      UpdateCategoryUseCase(
        iCategoryRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put<DeleteCategoryUseCase?>(
      DeleteCategoryUseCase(
        iCategoryRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put(
      CategoryController(
        addCategoryUseCase: Get.find(),
        getAllCategoryUseCase: Get.find(),
        updateCategoryUsecase: Get.find(),
        deleteCategoryUseCase: Get.find(),
      ),
    );
    Get.put<ICategoryItemDataSource?>(
      CategoryItemDataSource(),
      permanent: true,
    );
    Get.put<ICategoryItemRepository?>(
      CategoryItemRepository(iCategoryItemDataSource: Get.find()),
      permanent: true,
    );
    Get.put<GetAllCategoryItemUseCase?>(
      GetAllCategoryItemUseCase(
        iCategoryItemRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put<AddCategoryItemUseCase?>(
      AddCategoryItemUseCase(
        iCategoryItemRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put<UpdateCategoryItemUseCase?>(
      UpdateCategoryItemUseCase(
        iCategoryItemRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put<DeleteCategoryItemUseCase?>(
      DeleteCategoryItemUseCase(
        iCategoryItemRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put(
      CategoryItemController(
        addCategoryItemUseCase: Get.find(),
        getAllCategoryItemUseCase: Get.find(),
        updateCategoryItemUsecase: Get.find(),
        deleteCategoryItemUseCase: Get.find(),
      ),
    );
  }
}
