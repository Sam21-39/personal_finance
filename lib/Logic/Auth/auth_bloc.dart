// ignore_for_file: use_build_context_synchronously

import 'dart:async';
// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:personal_finance/Services/Auth/auth_services.dart';
import 'package:personal_finance/Services/Database/database.dart';
import 'package:personal_finance/Utils/constatns.dart';
import 'package:personal_finance/Views/Screens/Home/home.dart';

class AuthBloc {
  // controllers
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confPassCtrl = TextEditingController();
  final loadingCtrl = StreamController<bool>.broadcast();

  //declections
  AuthServices authServices = AuthServices();

  isValid(BuildContext context) {
    if (emailCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Email cannot be empty!',
      )));
      return false;
    }
    if (passCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Password cannot be empty!',
      )));
      return false;
    }

    if (!emailCtrl.text.contains(RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Not a valid email',
      )));
      return false;
    }
    if (passCtrl.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Password must be of 8 characters!',
      )));
      return false;
    }
    if (passCtrl.text != confPassCtrl.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Passwords doesn\'t match!',
      )));
      return false;
    }
    return true;
  }

  onSubmit(BuildContext context, bool isSignUp) async {
    loadingCtrl.sink.add(true);
    if (!isSignUp) {
      confPassCtrl.text = passCtrl.text;
    }
    if (isValid(context)) {
      if (isSignUp) {
        final res = await authServices.signUpAuth(
          emailCtrl.text.trim(),
          passCtrl.text.trim(),
        );
        if (res == SUCCESS) {
          await Database().createDatabase();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
              (route) => false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                res,
              ),
            ),
          );
        }
      } else {
        final res = await authServices.signInAuth(
          emailCtrl.text.trim(),
          passCtrl.text.trim(),
        );
        if (res == SUCCESS) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
              (route) => false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                res,
              ),
            ),
          );
        }
      }
    }
    loadingCtrl.sink.add(false);
  }
}
