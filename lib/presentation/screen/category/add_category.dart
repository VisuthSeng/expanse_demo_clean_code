// ignore_for_file: unused_local_variable, sized_box_for_whitespace, prefer_const_constructors

import 'package:expense_clean_code/core/constant/app_color.dart';
import 'package:expense_clean_code/core/enum/transaction_action_enum.dart';
import 'package:expense_clean_code/data/model/category_model.dart';
import 'package:expense_clean_code/data/model/color_model.dart';
import 'package:expense_clean_code/presentation/controller/category_controller.dart';

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
  late TextEditingController tecName;
  late TextEditingController tecColor;
  late ColorModel selectedColor;
  late FocusNode fnColor;
  late FocusNode fnName;

  @override
  void initState() {
    tecName = TextEditingController();
    tecColor = TextEditingController();
    fnColor = FocusNode();
    fnName = FocusNode();

    if (widget.transactionAction == TransactionAction.add) {
      fnName.requestFocus();
      selectedColor = ColorModel(code: 'grey', color: Colors.grey);
    } else {
      tecName.text = categoryController.selectedCategory.name;
      var id = AppColor.listColorButton.indexWhere(
          (x) => x.code == categoryController.selectedCategory.color);

      selectedColor = AppColor.listColorButton[id];
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
            color: selectedColor.code,
            col: selectedColor.color);
        categoryController.saveData(model);
        Get.back();
      } else {
        var model = CategoryModel(
          id: categoryController.selectedCategory.id,
          name: tecName.text,
          color: selectedColor.code,
          col: selectedColor.color,
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
      body: SingleChildScrollView(
        child: Container(
          width: 400,
          height: 800,
          color: Colors.black,
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Container(
                width: 200,
                height: 50,
                child: TextBox(
                  controller: tecName,
                  focusNode: fnName,
                  label: 'Category Name',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: 200,
                  height: 50,
                  child: Row(
                    children: AppColor.listColorButton
                        .map((x) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedColor = ColorModel(
                                        code: x.code, color: x.color);
                                  });
                                },
                                child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: x.color,
                                    child: selectedColor.code == x.code
                                        ? const Text('a')
                                        : const SizedBox.shrink()),
                              ),
                            ))
                        .toList(),
                  )),
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
      ),
    );
  }
}
