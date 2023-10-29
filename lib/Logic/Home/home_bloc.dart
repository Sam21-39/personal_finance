import 'dart:async';

import 'package:personal_finance/Models/expense_model.dart';
import 'package:personal_finance/Models/user_model.dart';
import 'package:personal_finance/Services/Database/database.dart';

class HomeBloc {
  Database database = Database();

  final userCtrl = StreamController<UserModel>.broadcast();
  final expensesCtrl = StreamController<List<ExpenseModel>>.broadcast();

  init() {
    getUserData();
  }

  getUserData() async {
    final user = await database.getUser();
    if (user.userId!.isNotEmpty) {
      userCtrl.sink.add(user);
    }
  }
}
