import 'package:expense_clean_code/core/enum/transaction_action_enum.dart';
import 'package:expense_clean_code/data/model/category_item.dart';
import 'package:expense_clean_code/presentation/controller/category_item_controller.dart';
import 'package:expense_clean_code/presentation/widget/textbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqlite_api.dart';

class AddCategoryItem extends StatefulWidget {
  final TransactionAction transactionAction;

  const AddCategoryItem({Key? key, required this.transactionAction})
      : super(key: key);
  @override
  State<AddCategoryItem> createState() => _AddCategoryItemState();
}

class _AddCategoryItemState extends State<AddCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Category Item"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: 200,
        height: 50,
      ),
    );
  }
}
