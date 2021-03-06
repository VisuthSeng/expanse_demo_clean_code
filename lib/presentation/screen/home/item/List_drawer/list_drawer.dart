// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:expense_clean_code/presentation/screen/category/category_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconDrawer extends StatelessWidget {
  final String? icontext;
  final IconData? icon;
  final Function route;
  IconDrawer({
    Key? key,
    @required this.icontext,
    @required this.icon,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      onTap: () {
        Get.to(() => CategoryScreen());
      },
      title: Text(
        icontext!,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
