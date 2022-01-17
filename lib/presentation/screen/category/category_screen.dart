// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:expense_clean_code/core/enum/transaction_action_enum.dart';
import 'package:expense_clean_code/presentation/controller/category_controller.dart';
import 'package:expense_clean_code/presentation/controller/category_item_controller.dart';
import 'package:expense_clean_code/presentation/screen/category/add_category.dart';
import 'package:expense_clean_code/presentation/screen/category/item/category_item.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
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
                onTap: () => Get.to(() => AddCategory(
                      transactionAction: TransactionAction.add,
                    )),
                child: Icon(Icons.add)),
          ),
        ],
      ),
      body: Container(
        height: 800,
        width: 500,
        color: Colors.black,
        child: Obx(
          () => SingleChildScrollView(
            child: Container(
              width: 800,
              color: Colors.black,
              child: Column(
                children: categoryController.listCategory
                    .map(
                      (x) => GestureDetector(
                        onTap: () {
                          categoryController.selectCategory(x);
                          final CategoryItemController categoryItemController =
                              Get.find();
                          categoryItemController.loadData();
                          Get.to(() => CategoryItemScreen());
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(x.colorNumber),
                              ),
                              width: 380,
                              height: 70,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    x.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.defaultDialog(
                                          title: "Option",
                                          content: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  categoryController
                                                      .editCategory(x);
                                                  Get.back();
                                                  Get.to(
                                                    () => AddCategory(
                                                      transactionAction:
                                                          TransactionAction
                                                              .edit,
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  width: 120,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.red),
                                                  child: Center(
                                                      child: Text("Edit")),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  categoryController
                                                      .deleteData(x.id!);
                                                  Get.back();
                                                },
                                                child: Container(
                                                  width: 120,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.red),
                                                  child: Center(
                                                      child: Text("Delete")),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: Icon(
                                        CupertinoIcons.chart_bar,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
