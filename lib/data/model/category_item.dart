class CategoryItemModel {
  //field for table
  static const String tableName = 't_categoryitem';
  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnColor = 'color';

  final int? id;
  final String name;
  final String? color;

  //query string for create table
  static String createTable() {
    return """CREATE TABLE $tableName (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,   
        $columnName TEXT,
        $columnColor TEXT
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
    this.color,
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

  factory CategoryItemModel.fromMap(Map<String, dynamic> map) {
    return CategoryItemModel(
      // id: map[columnId],
      name: map[columnName],
      color: map[columnColor],
    );
  }

  CategoryItemModel copyWith({
    int? id,
    String? code,
    String? name,
    String? color,
  }) {
    return CategoryItemModel(
      // id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }
}
