import 'package:expense_clean_code/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CategoryItemModel {
  //field for table
  static const String tableName = 't_category_item';
  static const String columnId = 'id';
  static const String columnCategoryID = "categoryID";
  static const String columnName = 'name';
  static const String columnColor = 'color';

  final int? id;
  final int categoryId;
  final String name;
  final String? color;
  final Color? col;

  //query string for create table
  static String createTable() {
    return """CREATE TABLE $tableName (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnCategoryID INTEGER,
        $columnName TEXT,
        $columnColor TEXT)""";
  }

  // static String insertData() {
  //   return """INSERT INTO $tableName ($columnCode,$columnName,
  //   $columnPhone,$columnDiscount,$columnNote,$columnPicture,$columnActive)
  //   VALUES ('1','ទូទៅ','',0,'',NULL,1);""";
  // }

  CategoryItemModel({
    this.id,
    required this.categoryId,
    required this.name,
    this.col,
    this.color,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnCategoryID: categoryId,
      columnName: name,
      columnColor: color,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  factory CategoryItemModel.fromMap(Map<String, dynamic> map) {
    var id =
        AppColor.listColorButton.indexWhere((x) => x.code == map[columnColor]);
    var coll = AppColor.listColorButton[id];
    return CategoryItemModel(
      id: map[columnId],
      categoryId: map[columnCategoryID],
      name: map[columnName],
      color: map[columnColor],
      col: coll.color,
    );
  }

  CategoryItemModel copyWith({
    int? id,
    int? categoryId,
    String? name,
    String? color,
    Color? col,
  }) {
    return CategoryItemModel(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      color: color ?? this.color,
      col: col ?? this.col,
    );
  }
}
