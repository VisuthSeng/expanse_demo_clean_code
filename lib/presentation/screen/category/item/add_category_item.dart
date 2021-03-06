// ignore_for_file: unused_local_variable, sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers

import 'package:expense_clean_code/core/constant/app_color.dart';
import 'package:expense_clean_code/core/enum/transaction_action_enum.dart';
import 'package:expense_clean_code/data/model/category_item_model.dart';

import 'package:expense_clean_code/presentation/controller/category_controller.dart';
import 'package:expense_clean_code/presentation/controller/category_item_controller.dart';

import 'package:expense_clean_code/presentation/widget/textbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategoryItem extends StatefulWidget {
  const AddCategoryItem({Key? key, required this.transactionAction})
      : super(key: key);
  final TransactionAction transactionAction;

  @override
  State<AddCategoryItem> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategoryItem> {
  final CategoryItemController categoryItemController = Get.find();
  final CategoryController categoryController = Get.find();
  late TextEditingController tecName;
  late TextEditingController tecColor;
  late Color selectedColor;

  late FocusNode fnName;

  @override
  void initState() {
    tecName = TextEditingController();
    tecColor = TextEditingController();

    fnName = FocusNode();

    if (widget.transactionAction == TransactionAction.add) {
      fnName.requestFocus();
      selectedColor = Colors.white;
    } else {
      tecName.text = categoryItemController.selectedCategory.name;

      selectedColor =
          Color(categoryItemController.selectedCategory.colorNumber);
    }

    super.initState();
  }

  @override
  void dispose() {
    tecName.dispose();
    tecColor.dispose();

    fnName.dispose();
    super.dispose();
  }

  bool validatorData() {
    if (tecName.text.trim() == '') {
      fnName.requestFocus();
      //AlertBox.warning('Please input code!');
      return false;
    }
    if (tecName.text.trim() == '') {
      fnName.requestFocus();
      //AlertBox.warning('Please input customer name!');
      return false;
    }

    return true;
  }

  saveData() async {
    if (validatorData()) {
      //check picture

      if (widget.transactionAction == TransactionAction.add) {
        var model = CategoryItemModel(
          categoryId: categoryController.selectedCategory.id!,
          name: tecName.text,
          colorNumber: selectedColor.value,
        );
        categoryItemController.saveData(model);
        Get.back();
      } else {
        var model = CategoryItemModel(
          id: categoryItemController.selectedCategory.id,
          categoryId: categoryController.selectedCategory.id!,
          name: tecName.text,
          colorNumber: selectedColor.value,
        );
        categoryItemController.updateData(model);
        Get.back();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          categoryController.selectedCategory.name,
        ),
      ),
      body: Container(
        width: 480,
        height: 800,
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Container(
              width: 200,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: TextBox(
                hinttext: "Category Items",
                controller: tecName,
                focusNode: fnName,
                label: '',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              height: 30,
              child: Text(
                "Pick a background color",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                  width: 500,
                  height: 50,
                  color: Colors.black,
                  child: Row(
                    children: AppColor.listColorButton
                        .map((x) => Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedColor = x;
                                  });
                                },
                                child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: x,
                                    child: selectedColor.value == x.value
                                        ? const Icon(Icons.check)
                                        : const SizedBox.shrink()),
                              ),
                            ))
                        .toList(),
                  )),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                saveData();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.orange,
                  ),
                  child: Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
