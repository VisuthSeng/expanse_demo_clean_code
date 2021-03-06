// ignore_for_file: unused_local_variable, sized_box_for_whitespace, prefer_const_constructors

import 'package:expense_clean_code/core/constant/app_color.dart';
import 'package:expense_clean_code/core/enum/transaction_action_enum.dart';
import 'package:expense_clean_code/data/model/category_model.dart';

import 'package:expense_clean_code/presentation/controller/category_controller.dart';
import 'package:expense_clean_code/presentation/controller/expense_view_controller.dart';

import 'package:expense_clean_code/presentation/widget/textbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key, required this.transactionAction})
      : super(key: key);
  final TransactionAction transactionAction;

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final CategoryController categoryController = Get.find();
  final ExpenseViewController expenseViewController = Get.find();
  late TextEditingController tecName;
  late TextEditingController tecColor;
  late FocusNode fnColor;
  late FocusNode fnName;
  late Color selectedColor;

  @override
  void initState() {
    tecName = TextEditingController();
    tecColor = TextEditingController();
    fnColor = FocusNode();
    fnName = FocusNode();

    if (widget.transactionAction == TransactionAction.add) {
      fnName.requestFocus();
      selectedColor = Colors.white;
    } else {
      tecName.text = categoryController.selectedCategory.name;

      selectedColor = Color(categoryController.selectedCategory.colorNumber);
    }

    super.initState();
  }

  @override
  void dispose() {
    tecName.dispose();
    tecColor.dispose();
    fnColor.dispose();

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
        var model = CategoryModel(
            name: tecName.text,
            // color: selectedColor.code,
            colorNumber: selectedColor.value);
        categoryController.saveData(model);
        Get.back();
      } else {
        var model = CategoryModel(
          id: categoryController.selectedCategory.id,
          name: tecName.text,
          // color: selectedColor.code,
          colorNumber: selectedColor.value,
        );
        categoryController.updateData(model);
        Get.back();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Add Category"),
      ),
      body: Container(
        width: 400,
        height: 800,
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Container(
              width: 300,
              height: 50,
              child: TextBox(
                hinttext: "Category Name",
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
                  color: Colors.black,
                  width: 600,
                  height: 80,
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
