// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:expense_clean_code/core/enum/transaction_action_enum.dart';
import 'package:expense_clean_code/data/model/expense_model.dart';
import 'package:expense_clean_code/presentation/controller/category_controller.dart';
import 'package:expense_clean_code/presentation/controller/category_item_controller.dart';
import 'package:expense_clean_code/presentation/controller/expense_controller.dart';
import 'package:expense_clean_code/presentation/widget/textbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExpanseScreen extends StatefulWidget {
  const ExpanseScreen({Key? key, required this.transactionAction})
      : super(key: key);
  final TransactionAction transactionAction;
  @override
  State<ExpanseScreen> createState() => _ExpanseScreenState();
}

class _ExpanseScreenState extends State<ExpanseScreen> {
  final CategoryController categoryController = Get.find();
  final ExpenseController expenseController = Get.find();
  final CategoryItemController categoryItemController = Get.find();
  String formatted = DateFormat('hh:mm').format(DateTime.now());
  late TextEditingController tecAmount;
  late TextEditingController tecNote;

  late FocusNode fnAmount;
  late FocusNode fnNote;

  @override
  void initState() {
    tecAmount = TextEditingController();
    tecNote = TextEditingController();
    fnNote = FocusNode();
    fnAmount = FocusNode();
    if (widget.transactionAction == TransactionAction.add) {
      fnAmount.requestFocus();
    } else {}
    super.initState();
  }

  @override
  void dispose() {
    tecAmount.dispose();
    tecNote.dispose();
    fnAmount.dispose();
    super.dispose();
  }

  bool validatorData() {
    if (tecAmount.text.trim() == '') {
      fnAmount.requestFocus();
      //AlertBox.warning('Please input code!');
      return false;
    }
    return true;
  }

  saveData() async {
    if (validatorData()) {
      //check picture

      if (widget.transactionAction == TransactionAction.add) {
        var model = ExpenseModel(
          amount: tecAmount.text,
          categoryId: categoryController.selectedCategory.id!,
          // color: selectedColor.code,
          dateTime: DateTime.now(), note: tecNote.text,
          categoryItem: categoryItemController.selectedCategory.name,
        );
        expenseController.saveData(model);
        Get.back();
      } else {
        // var model = ExpenseModel(
        //   id: expenseController.selectedExpensed.id!,
        //   amount: tecAmount.text,
        //   categoryId: expenseController.selectedExpensed.categoryId,
        //   dateTime: DateTime.now(),
        //   note: '',
        //   // color: selectedColor.code,
        // );
        // expenseController.updateData(model);
        // Get.back();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.black,
        title: const Text("Add Expense"),
        actions: [
          GestureDetector(
            onTap: () {
              saveData();
              Get.snackbar("You have saved", "Add Expensed",
                  backgroundColor: Colors.orange,
                  snackPosition: SnackPosition.BOTTOM);
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 20, right: 30),
              child: Text(
                "Save",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => Container(
          width: 400,
          height: 800,
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 80, bottom: 10),
                    child: TextBox(
                      hinttext: "\$ 00.00",
                      controller: tecAmount,
                      focusNode: fnAmount,
                      label: '',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          categoryController.selectedCategory.name,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 400,
                height: 400,
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  padding: EdgeInsets.all(12),
                  crossAxisCount: 3,
                  children: categoryItemController.listCategoryItem
                      .map(
                        (x) => GestureDetector(
                          onTap: () {
                            setState(() {
                              tecNote.text = tecNote.text + x.name;
                            });
                          },
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(x.colorNumber),
                            ),
                            child: Center(
                              child: Text(
                                x.name,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                width: 300,
                height: 30,
                child: Text(
                  "Remark",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Container(
                width: 400,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextBox(
                      hinttext: "",
                      controller: tecNote,
                      focusNode: fnNote,
                      label: '',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
