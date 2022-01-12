import 'package:expense_clean_code/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  //field for table
  static const String tableName = 't_category';
  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnColor = 'color';

  final int? id;
  final String name;
  final String? color;
  final Color? col;

  //query string for create table
  static String createTable() {
    return """CREATE TABLE $tableName (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,  
        $columnColor TEXT,$columnName TEXT)""";
  }

  // static String insertData() {
  //   return """INSERT INTO $tableName ($columnCode,$columnName,
  //   $columnPhone,$columnDiscount,$columnNote,$columnPicture,$columnActive)
  //   VALUES ('1','ទូទៅ','',0,'',NULL,1);""";
  // }

  CategoryModel({
    this.col,
    this.color,
    this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnColor: color,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    var id =
        AppColor.listColorButton.indexWhere((x) => x.code == map[columnColor]);
    var coll = AppColor.listColorButton[id];
    return CategoryModel(
      id: map[columnId],
      name: map[columnName],
      color: map[columnColor],
      col: coll.color,
    );
  }

  CategoryModel copyWith({
    int? id,
    String? name,
    required String color,
    Color? col,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color,
      col: col,
    );
  }
}
