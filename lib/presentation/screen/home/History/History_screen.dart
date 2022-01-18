// ignore_for_file: prefer_const_constructors, file_names, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:expense_clean_code/presentation/controller/expense_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final ExpenseViewController expenseViewController = Get.find();

  String formatted = DateFormat('hh:mm').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.black,
        title: Text("History"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Obx(
                () => Column(
                  children: [
                    Container(
                      color: Colors.black,
                      width: 400,
                      height: 50,
                      child: Text(
                        DateFormat('MMM d,y').format(
                            expenseViewController.selectedExpensed.dateTime),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      children: expenseViewController.listexpenseView
                          .map(
                            (x) => Container(
                              width: 400,
                              height: 80,
                              color: Colors.black,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.food_bank,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            x.categoryName,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            DateFormat('d MMM H:m')
                                                .format(x.dateTime),
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        x.note,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "\$ ${x.amount}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
