class CategoryModel {
  //field for table
  static const String tableName = 't_category';
  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnColorNumber = 'colorNumber';

  final int? id;
  final String name;
  final int colorNumber;

  //query string for create table
  static String createTable() {
    return """CREATE TABLE $tableName (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,  
        $columnName TEXT,
        $columnColorNumber INTEGER)""";
  }

  // static String insertData() {
  //   return """INSERT INTO $tableName ($columnCode,$columnName,
  //   $columnPhone,$columnDiscount,$columnNote,$columnPicture,$columnActive)
  //   VALUES ('1','ទូទៅ','',0,'',NULL,1);""";
  // }

  CategoryModel({
    this.id,
    required this.name,
    required this.colorNumber,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnColorNumber: colorNumber,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map[columnId],
      name: map[columnName],
      colorNumber: map[columnColorNumber],
    );
  }

  CategoryModel copyWith({
    int? id,
    String? name,
    int? colorNumber,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      colorNumber: colorNumber ?? this.colorNumber,
    );
  }
}
