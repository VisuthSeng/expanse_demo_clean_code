class CategoryItemModel {
  //field for table
  static const String tableName = 't_categoryitem';
  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnDiscount = 'discount';
  static const String columnNote = 'note';
  static const String columnPicture = 'picture';

  final int? id;
  final String name;
  final int discount;
  final String note;
  final String? picture;

  //query string for create table
  static String createTable() {
    return """CREATE TABLE $tableName (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,   
        $columnName TEXT, 
        $columnDiscount INTEGER, 
        $columnNote TEXT,  
        $columnPicture TEXT 
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
    required this.discount,
    required this.note,
    this.picture,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnDiscount: discount,
      columnNote: note,
      columnPicture: picture,
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
      discount: map[columnDiscount],
      note: map[columnNote],
      picture: map[columnPicture],
    );
  }

  CategoryItemModel copyWith({
    int? id,
    String? code,
    String? name,
    String? phone,
    int? discount,
    String? note,
    String? picture,
  }) {
    return CategoryItemModel(
      // id: id ?? this.id,
      name: name ?? this.name,
      discount: discount ?? this.discount,
      note: note ?? this.note,
      picture: picture ?? this.picture,
    );
  }
}
