class CategoryItemModel {
  //field for table
  static const String tableName = 't_category_item';
  static const String columnId = 'id';
  static const String columnCategoryID = "categoryID";
  static const String columnName = 'name';
  static const String columnColorNumber = 'colorNumber';

  final int? id;
  final int categoryId;
  final String name;
  final int colorNumber;

  //query string for create table
  static String createTable() {
    return """CREATE TABLE $tableName (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnCategoryID INTEGER,
        $columnName TEXT,
        $columnColorNumber INTEGER)""";
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
    required this.colorNumber,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnCategoryID: categoryId,
      columnName: name,
      columnColorNumber: colorNumber,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  factory CategoryItemModel.fromMap(Map<String, dynamic> map) {
    return CategoryItemModel(
      id: map[columnId],
      categoryId: map[columnCategoryID],
      name: map[columnName],
      colorNumber: map[columnColorNumber],
    );
  }

  CategoryItemModel copyWith({
    int? id,
    int? categoryId,
    String? name,
    int? colorNumber,
  }) {
    return CategoryItemModel(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      colorNumber: colorNumber ?? this.colorNumber,
    );
  }
}
