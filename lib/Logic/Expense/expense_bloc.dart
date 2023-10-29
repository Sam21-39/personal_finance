import 'dart:async';

import 'package:personal_finance/Models/category_model.dart';
import 'package:personal_finance/Services/Database/database.dart';

class ExpenseBloc {
  final categoryCtrl = StreamController<List<CategoryModel>>.broadcast();

  Database db = Database();

  getCategories() async {
    final category = await db.getCategories();

    categoryCtrl.sink.add(category);
  }
}
