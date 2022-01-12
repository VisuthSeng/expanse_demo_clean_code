// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:expense_clean_code/core/enum/transaction_action_enum.dart';

import 'package:expense_clean_code/presentation/controller/category_item_controller.dart';

import 'package:expense_clean_code/presentation/screen/category/item/add_category_item.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItemScreen extends StatelessWidget {
  final CategoryItemController categoryItemController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Category Items",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
                onTap: () {
                  Get.to(() => AddCategoryItem(
                        transactionAction: TransactionAction.add,
                      ));
                },
                child: Icon(Icons.add)),
          ),
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Container(
            width: 500,
            child: Column(
              children: categoryItemController.listCategoryItem
                  .map(
                    (x) => GestureDetector(
                      onTap: () {
                        Get.to(() => AddCategoryItem(
                              transactionAction: TransactionAction.add,
                            ));
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: x.col),
                            width: 380,
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  x.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
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
                                                categoryItemController
                                                    .editCategoryItem(x);
                                                Get.back();
                                                Get.to(
                                                  () => AddCategoryItem(
                                                    transactionAction:
                                                        TransactionAction.edit,
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
                                                child:
                                                    Center(child: Text("Edit")),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                categoryItemController
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
                                      Icons.settings_applications,
                                      size: 30,
                                      color: Colors.white,
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
    );
  }
}
