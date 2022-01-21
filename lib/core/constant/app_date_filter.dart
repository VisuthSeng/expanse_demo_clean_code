import 'package:expense_clean_code/data/model/pick_date_model.dart';

class AppDateFilter {
  const AppDateFilter();

  static List<PickDateModel> listDateFilter = [
    PickDateModel(
      name: "Today",
      startDate: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day - 1, 23, 59, 59),
      endDate: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 23, 59, 59),
    ),
    PickDateModel(
      name: "Yesterday",
      startDate: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day - 1, 0, 0, 0),
      endDate: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 0, 0, 0),
    ),
    PickDateModel(
      name: "This Week",
      startDate: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.monday + 16, 0, 0, 0),
      endDate: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.monday + 23, 0, 0, 0),
    ),
    PickDateModel(
      name: "This Month",
      startDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.monday, 0, 0, 1),
      endDate: DateTime(DateTime.now().year, DateTime.now().month + 1,
          DateTime.monday, 0, 0, 0),
    ),
    PickDateModel(
      name: "This Year",
      startDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.monday, 0, 0, 1),
      endDate: DateTime(DateTime.now().year + 1, DateTime.now().month,
          DateTime.monday, 0, 0, 0),
    ),
  ];
}
