import 'package:expense_clean_code/data/datasource/category_datasource.dart';
import 'package:expense_clean_code/data/datasource/category_item_datasource.dart';
import 'package:expense_clean_code/data/datasource/expense_datasource.dart';
import 'package:expense_clean_code/data/datasource/expense_view_datasource.dart';
import 'package:expense_clean_code/data/repository/app_repository.dart';
import 'package:expense_clean_code/data/repository/category_item_repository.dart';
import 'package:expense_clean_code/data/repository/category_repository.dart';
import 'package:expense_clean_code/data/repository/expense_repository.dart';
import 'package:expense_clean_code/data/repository/expense_view_repository.dart';

import 'package:expense_clean_code/domain/repository/app_repository_interface.dart';
import 'package:expense_clean_code/domain/repository/category_interface_repository.dart';
import 'package:expense_clean_code/domain/repository/category_item_interface_repository.dart';
import 'package:expense_clean_code/domain/repository/expense_item_interface_repository.dart';
import 'package:expense_clean_code/domain/repository/expense_view_interface_repository.dart';

import 'package:expense_clean_code/domain/usecase/app_usecase.dart';
import 'package:expense_clean_code/domain/usecase/category_item_usecase.dart';
import 'package:expense_clean_code/domain/usecase/category_usecase.dart';
import 'package:expense_clean_code/domain/usecase/expense_usecase.dart';
import 'package:expense_clean_code/domain/usecase/expense_view_usecase.dart';

import 'package:expense_clean_code/presentation/controller/app_controller.dart';
import 'package:expense_clean_code/presentation/controller/category_controller.dart';
import 'package:expense_clean_code/presentation/controller/category_item_controller.dart';
import 'package:expense_clean_code/presentation/controller/expense_controller.dart';
import 'package:expense_clean_code/presentation/controller/expense_view_controller.dart';

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
    Get.put<GetCategoryItemByIdUseCase?>(
      GetCategoryItemByIdUseCase(
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
        getCategoryItemByIdUseCase: Get.find(),
        updateCategoryItemUsecase: Get.find(),
        deleteCategoryItemUseCase: Get.find(),
      ),
    );

    Get.put<IExpenseDataSource?>(
      ExpenseDataSource(),
      permanent: true,
    );
    Get.put<IExpenseRepository?>(
      ExpenseRepository(expenseDataSource: Get.find()),
      permanent: true,
    );
    Get.put<GetAllExpenseUseCase?>(
      GetAllExpenseUseCase(
        expenseRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put<GetExpenseByIdUseCase?>(
      GetExpenseByIdUseCase(
        expenseRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put<AddExpenseUseCase?>(
      AddExpenseUseCase(
        expenseRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put<UpdateExpenseUseCase?>(
      UpdateExpenseUseCase(
        expenseRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put<DeleteExpenseUseCase?>(
      DeleteExpenseUseCase(
        expenseRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put(
      ExpenseController(
        addExpenseUseCase: Get.find(),
        getAllExpenseUseCase: Get.find(),
        getExpenseByIdUseCase: Get.find(),
        updateExpenseUseCase: Get.find(),
        deleteExpenseUseCase: Get.find(),
      ),
    );

    Get.put<IExpenseViewDataSource?>(
      ExpenseViewDataSource(),
      permanent: true,
    );
    Get.put<IExpenseViewRepository?>(
      ExpenseViewRepository(expenseViewDataSource: Get.find()),
      permanent: true,
    );
    Get.put<GetAllExpenseViewUseCase?>(
      GetAllExpenseViewUseCase(
        expenseViewRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put<GetAllExpenseViewByDateUseCase?>(
      GetAllExpenseViewByDateUseCase(
        expenseViewRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put<GetAllSumExpenseByDateUseCase?>(
      GetAllSumExpenseByDateUseCase(
        expenseViewRepository: Get.find(),
      ),
      permanent: true,
    );

    Get.put(
      ExpenseViewController(
        getAllExpenseViewUseCase: Get.find(),
        getAllExpenseViewByDateUseCase: Get.find(),
        getAllSumExpenseByDateUseCase: Get.find(),
      ),
    );
  }
}
