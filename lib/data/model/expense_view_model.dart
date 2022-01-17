import 'package:expense_clean_code/data/model/category_model.dart';
import 'package:expense_clean_code/data/model/expense_model.dart';

class ExpenseViewModel {
  //field for table
  static const String viewName = 'v_expense';
  static const String columnId = 'id';
  static const String columnCategoryID = "categoryID";
  static const String columnCategoryName = "name";
  static const String columnAmount = 'amount';

  static const String columnNote = 'note';
  static const String columnDatetime = 'datetime';

  final int? id;
  final int categoryId;
  final String categoryName;
  final String amount;
  final DateTime dateTime;
  final String note;

  //query string for create table
  static String createView() {
    return """CREATE VIEW $viewName AS 
    SELECT ex.id, ex.categoryID, ca.name, ex.amount, ex.datetime, ex.note
      FROM
      ${ExpenseModel.tableName} ex INNER JOIN ${CategoryModel.tableName} ca ON ex.categoryID = ca.id;""";
  }

  // static String insertData() {
  //   return """INSERT INTO $tableName ($columnCode,$columnName,
  //   $columnPhone,$columnDiscount,$columnNote,$columnPicture,$columnActive)
  //   VALUES ('1','ទូទៅ','',0,'',NULL,1);""";
  // }

  ExpenseViewModel(
      {this.id,
      required this.categoryName,
      required this.categoryId,
      required this.amount,
      required this.dateTime,
      required this.note});

  factory ExpenseViewModel.fromMap(Map<String, dynamic> map) {
    return ExpenseViewModel(
      id: map[columnId],
      categoryId: map[columnCategoryID],
      categoryName: map[columnCategoryName],
      amount: map[columnAmount],
      dateTime: DateTime.parse(map[columnDatetime]),
      note: map[columnNote],
    );
  }
}
