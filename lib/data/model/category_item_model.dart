class CategoryItemModel {
  //field for table
  static const String tableName = 't_categoryitem';
  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnCategoryID = "categoryID";

  final int? id;
  final String name;
  final int? categoryid;

  //query string for create table
  static String createTable() {
    return """CREATE TABLE $tableName (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,   
        $columnName TEXT,
        $columnCategoryID INTEGER
        )""";
  }

  // static String insertData() {
  //   return """INSERT INTO $tableName ($columnCode,$columnName,
  //   $columnPhone,$columnDiscount,$columnNote,$columnPicture,$columnActive)
  //   VALUES ('1','ទូទៅ','',0,'',NULL,1);""";
  // }

  CategoryItemModel({
    this.id,
    required this.name,
    this.categoryid,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  factory CategoryItemModel.fromMap(Map<String, dynamic> map) {
    return CategoryItemModel(
      // id: map[columnId],
      name: map[columnName],
      categoryid: map[columnCategoryID],
    );
  }

  CategoryItemModel copyWith({
    int? id,
    String? name,
    int? categoryid,
  }) {
    return CategoryItemModel(
      // id: id ?? this.id,
      name: name ?? this.name,
      categoryid: categoryid ?? this.categoryid,
    );
  }
}
