// ignore_for_file: prefer_const_constructors

import 'package:expense_clean_code/presentation/home/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateCategoryItem extends StatelessWidget {
  const CreateCategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Create Category Item"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 60, top: 10),
            child: Container(
              width: 250,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.red),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Your Title",
                  labelText: 'Title',
                ),
                keyboardType: TextInputType.name,
                obscureText: false,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, top: 10),
            child: Container(
              width: 250,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.redAccent),
              child: ElevatedButton(
                  onPressed: () => Get.to(HomeScreen()),
                  child: Text("Pick Category v"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
