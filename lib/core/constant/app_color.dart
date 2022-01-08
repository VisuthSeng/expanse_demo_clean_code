import 'package:expense_clean_code/data/model/color_model.dart';
import 'package:flutter/material.dart';

class AppColor {
  const AppColor();
  static List<ColorModel> listColorButton = [
    ColorModel(
      code: "b",
      color: Colors.blue,
    ),
    ColorModel(
      code: "red",
      color: Colors.red,
    ),
    ColorModel(
      code: "grey",
      color: Colors.grey,
    ),
    ColorModel(
      code: "yellow",
      color: Colors.yellow,
    ),
    ColorModel(code: "orange", color: Colors.orange),
  ];
}
