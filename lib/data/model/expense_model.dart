class ExpenseModel {
  //field for table
  static const String tableName = 't_expense';
  static const String columnId = 'id';
  static const String columnCategoryID = "categoryID";
  static const String columnAmount = 'amount';
  static const String columnDate = 'columnDate';
  static const String columnNote = 'columnNote';

  final int? id;
  final int categoryId;
  final String amount;
  final String date;
  final String? note;

  //query string for create table
  static String createTable() {
    return """CREATE TABLE $tableName (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnCategoryID INTEGER,
        $columnAmount TEXT,
        $columnDate TEXT,
        $columnNote TEXT)""";
  }

  // static String insertData() {
  //   return """INSERT INTO $tableName ($columnCode,$columnName,
  //   $columnPhone,$columnDiscount,$columnNote,$columnPicture,$columnActive)
  //   VALUES ('1','ទូទៅ','',0,'',NULL,1);""";
  // }

  ExpenseModel(
      {this.id,
      required this.categoryId,
      required this.amount,
      required this.date,
      this.note});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnCategoryID: categoryId,
      columnAmount: amount,
      columnDate: date,
      columnNote: note,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map[columnId],
      categoryId: map[columnCategoryID],
      amount: map[columnAmount],
      date: map[columnDate],
      note: map[columnNote],
    );
  }

  ExpenseModel copyWith({
    int? id,
    int? categoryId,
    String? amount,
    String? date,
    String? note,
  }) {
    return ExpenseModel(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      note: date ?? this.date,
    );
  }
}
