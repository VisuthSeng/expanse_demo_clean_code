// ignore_for_file: prefer_const_constructors

import 'package:expense_clean_code/presentation/view/select_category/create_category/create_category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectCategoryView extends StatelessWidget {
  const SelectCategoryView({Key? key}) : super(key: key);

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
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () => Get.to(CreateCategoryItem()),
            child: Padding(
              padding: const EdgeInsets.only(left: 60, top: 10),
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: Colors.red),
                child: Center(
                  child: Text("Entertainment"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
