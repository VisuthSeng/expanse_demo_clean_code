// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

class quick_add_item extends StatelessWidget {
  const quick_add_item({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.grey[900]),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Icon(
                Icons.deck,
                color: Colors.green,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Bonus",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
