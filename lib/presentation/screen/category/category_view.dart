// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:expense_clean_code/presentation/controller/category_controller.dart';
import 'package:expense_clean_code/presentation/screen/category/add_category.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectCategoryView extends StatelessWidget {
  final CategoryController categoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Select Category",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
                onTap: () => Get.to(
                      AddCategory(),
                    ),
                child: Icon(Icons.add)),
          ),
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: categoryController.listCategory
                .map(
                  (e) => SizedBox(
                    width: 200,
                    height: 50,
                    child: Text(
                      e.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                          fontSize: 20),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
