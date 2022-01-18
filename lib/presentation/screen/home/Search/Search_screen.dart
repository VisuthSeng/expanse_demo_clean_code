// ignore_for_file: file_names

import 'package:expense_clean_code/core/constant/app_date_filter.dart';
import 'package:expense_clean_code/presentation/controller/expense_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ExpenseViewController expenseViewController = Get.find();
  late DateTime startDate;
  late DateTime endDate;
  @override
  void initState() {
    startDate = DateTime.now();
    endDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Search"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Obx(
            () => Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Start",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange,
                        ),
                        child: Center(
                          child: ListTile(
                            title: Text(
                              "Date: ${startDate.year},${startDate.month},${startDate.day}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.keyboard_arrow_down),
                            onTap: () {
                              startDated();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "End ",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange,
                        ),
                        child: Center(
                          child: ListTile(
                            title: Text(
                              "Date: ${endDate.year},${endDate.month},${endDate.day}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.keyboard_arrow_down),
                            onTap: () {
                              endDated();
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          expenseViewController.getexpensebyDate(
                              startDate, endDate);
                        },
                        child: const Text("Confirm"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: AppDateFilter.listDateFilter
                        .map(
                          (x) => Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  expenseViewController.getexpensebyDate(
                                      x.startDate, x.endDate);
                                },
                                child: Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.orange,
                                  ),
                                  child: Center(
                                    child: Text(
                                      x.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: expenseViewController.listexpenseViewbyDate
                      .map(
                        (x) => Container(
                          width: 400,
                          height: 80,
                          color: Colors.black,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.food_bank,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        x.categoryName,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      Text(
                                        DateFormat('d MMM H:m')
                                            .format(x.dateTime),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    x.note,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "\$ ${x.amount}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
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
        ),
      ),
    );
  }

  startDated() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 3),
      lastDate: DateTime(DateTime.now().year + 3),
    );
    setState(() {
      startDate = DateTime(date!.year, date.month, date.day, 0, 0, 1);
    });
  }

  endDated() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 3),
      lastDate: DateTime(DateTime.now().year + 3),
    );
    setState(() {
      endDate = DateTime(date!.year, date.month, date.day, 23, 59, 59);
    });
  }
}
