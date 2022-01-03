// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';

class quick_add_item extends StatelessWidget {
  final String title;
  final Color Coloricon;
  final Color Colortitle;

  const quick_add_item(
      {Key? key,
      required this.title,
      required this.Colortitle,
      required this.Coloricon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.grey[600]),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Icon(
                Icons.deck,
                color: Coloricon,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colortitle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
