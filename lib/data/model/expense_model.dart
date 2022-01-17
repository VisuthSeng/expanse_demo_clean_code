class ExpenseModel {
  //field for table
  static const String tableName = 't_expense';
  static const String columnId = 'id';
  static const String columnCategoryID = "categoryID";
  static const String columnAmount = 'amount';

  static const String columnNote = 'note';
  static const String columnDatetime = 'datetime';
  static const String columnCategoryItem = "categoryItem";

  final int? id;
  final int categoryId;
  final String amount;
  final DateTime dateTime;
  final String note;
  final String categoryItem;

  //query string for create table
  static String createTable() {
    return """CREATE TABLE $tableName (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnCategoryID INTEGER,
        $columnAmount TEXT,
        $columnDatetime TEXT,
        $columnCategoryItem TEXT,
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
      required this.categoryItem,
      required this.amount,
      required this.dateTime,
      required this.note});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnCategoryID: categoryId,
      columnAmount: amount,
      columnDatetime: dateTime.toIso8601String(),
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
      categoryItem: map[columnCategoryItem],
      amount: map[columnAmount],
      dateTime: DateTime.parse(map[columnDatetime]),
      note: map[columnNote],
    );
  }

  ExpenseModel copyWith({
    int? id,
    int? categoryId,
    String? categoryItem,
    String? amount,
    required DateTime dateTime,
    String? note,
  }) {
    return ExpenseModel(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      categoryItem: categoryItem ?? this.categoryItem,
      amount: amount ?? this.amount,
      note: note ?? this.note,
      dateTime: dateTime,
    );
  }
}
