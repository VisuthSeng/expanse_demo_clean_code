// ignore_for_file: prefer_const_constructors

import 'package:expense_clean_code/core/enum/transaction_action_enum.dart';

import 'package:flutter/material.dart';

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
        title: const Text("Category Item"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SizedBox(
        width: 200,
        height: 50,
      ),
    );
  }
}
