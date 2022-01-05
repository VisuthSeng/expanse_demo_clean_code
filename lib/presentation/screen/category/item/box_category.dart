import 'package:expense_clean_code/presentation/controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoxCategory extends StatelessWidget {
  final CategoryController createCategoryController = Get.find();

  BoxCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Obx(
        () => Column(
          children: createCategoryController.listCategory
              .map(
                (e) => Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red[100],
                  ),
                  child: Text(e.name),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
