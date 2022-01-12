// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, use_key_in_widget_constructors

import 'package:expense_clean_code/presentation/controller/category_controller.dart';

import 'package:expense_clean_code/presentation/screen/home/item/List_drawer/list_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardScreen extends StatelessWidget {
  final CategoryController categoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 400,
              color: Colors.black,
              child: Image(
                image: AssetImage(
                  "asset/suth.jpg",
                ),
                fit: BoxFit.contain,
              ),
            ),
            IconDrawer(
              icontext: "Category",
              icon: Icons.category,
              route: Get.back,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Dashboard"),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.help_center),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          height: 800,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 380,
                  height: 130,
                  color: Colors.grey[850],
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 190,
                            height: 139,
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 35),
                              child: Column(
                                children: [
                                  Text(
                                    "TODAY'S EXPENSE",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "\$ 0",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 190,
                            height: 139,
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 35),
                              child: Column(
                                children: [
                                  Text(
                                    "TOTAL'S EXPENSE",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "\$ 0",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select Category",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: Text(
                      "Manage Category",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  SingleChildScrollView(
                    child: SizedBox(
                      width: 400,
                      height: 600,
                      child: GridView.count(
                        scrollDirection: Axis.vertical,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        padding: EdgeInsets.all(12),
                        crossAxisCount: 3,
                        children: categoryController.listCategory
                            .map(
                              (x) => Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey),
                                child: Center(child: Text(x.name)),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
