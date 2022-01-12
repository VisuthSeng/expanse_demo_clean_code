// ignore_for_file: prefer_const_constructors, file_names

import 'package:expense_clean_code/presentation/controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  final CategoryController categoryController = Get.find();

  HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.black,
        title: Text("History"),
      ),
    );
  }
}
