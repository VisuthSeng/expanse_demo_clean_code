// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, file_names, must_be_immutable, dead_code, annotate_overrides, use_key_in_widget_constructors

import 'package:expense_clean_code/presentation/screen/home/item/List_drawer/list_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

// import 'item/quick_add_item/quick_add_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController? pageController;
  int selectindex = 0;
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectindex);
  }

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
        title: const Text("Dashborad"),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        height: 800,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: Colors.black,
            width: 500,
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
                Row(
                  children: [
                    // quick_add_item(
                    //   Colortitle: Colors.white54,
                    //   Coloricon: Colors.greenAccent,
                    // ),
                  ],
                ),
                Container(
                  color: Colors.black,
                  width: 400,
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: WaterDropNavBar(
        barItems: [
          BarItem(filledIcon: Icons.home, outlinedIcon: Icons.home_outlined),
          BarItem(
              filledIcon: Icons.report, outlinedIcon: Icons.report_outlined),
        ],
        selectedIndex: selectindex,
        onItemSelected: (index) {
          setState(
            () {
              selectindex = index;
            },
          );
        },
      ),
    );
  }
}
