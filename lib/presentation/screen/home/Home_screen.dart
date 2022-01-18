// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, file_names, must_be_immutable, dead_code, annotate_overrides, use_key_in_widget_constructors

import 'package:expense_clean_code/presentation/controller/expense_view_controller.dart';
import 'package:expense_clean_code/presentation/screen/home/DashBoard/DashBoard_screen.dart';
import 'package:expense_clean_code/presentation/screen/home/History/History_screen.dart';
import 'package:expense_clean_code/presentation/screen/home/Search/Search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  void onTapped(int index) {
    setState(() {
      selectindex = index;
      if (selectindex == 1) {
        final ExpenseViewController expenseViewController = Get.find();

        expenseViewController.loadData();
      }
    });
    pageController!.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          DashBoardScreen(),
          SearchScreen(),
          HistoryScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "DashBoard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),
        ],
        currentIndex: selectindex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        backgroundColor: Colors.black,
        onTap: onTapped,
      ),
    );
  }
}
