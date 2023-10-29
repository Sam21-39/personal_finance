import 'package:shared_preferences/shared_preferences.dart';

class Sprefs {
  String isLoggedIn = "isLoggedIn";

  getLoginSP() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getBool(isLoggedIn);
  }

  addLoginSP(bool val) async {
    final sp = await SharedPreferences.getInstance();
    return sp.setBool(isLoggedIn, val);
  }
}
