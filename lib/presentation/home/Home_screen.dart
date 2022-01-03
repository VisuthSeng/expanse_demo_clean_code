// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'item/quick_add_item/quick_add_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: Colors.black,
            width: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Hello, Suth",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
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
                                        fontSize: 28,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 35, top: 10),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.blue[300],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                          height: 40,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 2),
                                            child: Image(
                                              color: Colors.white,
                                              image: AssetImage(
                                                  "asset/Finance-Money-icon.png"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Text(
                                    "CASH",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey[500]),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 30, top: 5),
                                  child: Text(
                                    "897,000,00 KHR",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
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
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Total Expense",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    width: 380,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        "Graph",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quick Add",
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
                    quick_add_item(
                      title: "Bonus",
                      Colortitle: Colors.white54,
                      Coloricon: Colors.greenAccent,
                    ),
                    quick_add_item(
                      title: "Food",
                      Colortitle: Colors.white54,
                      Coloricon: Colors.blueAccent,
                    ),
                    quick_add_item(
                      title: "Health",
                      Colortitle: Colors.white54,
                      Coloricon: Colors.redAccent,
                    ),
                    quick_add_item(
                      title: "Hangout",
                      Colortitle: Colors.white54,
                      Coloricon: Colors.blueGrey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    quick_add_item(
                      title: "Shopping",
                      Colortitle: Colors.white54,
                      Coloricon: Colors.yellow,
                    ),
                    quick_add_item(
                      title: "Salary",
                      Colortitle: Colors.white54,
                      Coloricon: Colors.red,
                    ),
                    quick_add_item(
                      title: "Transport",
                      Colortitle: Colors.white54,
                      Coloricon: Colors.lightGreen,
                    ),
                    quick_add_item(
                      title: "Utilities",
                      Colortitle: Colors.white54,
                      Coloricon: Colors.pink,
                    ),
                  ],
                ),
                Container(
                  color: Colors.black,
                  width: 400,
                  height: 200,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
