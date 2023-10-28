import 'dart:developer';

import 'package:flutter/material.dart';

class AuthBloc {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confPassCtrl = TextEditingController();

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
    if (!isSignUp) {
      confPassCtrl.text = passCtrl.text;
    }
    if (isValid(context)) {
      log('Success');
    } else {
      log('Failed');
    }
  }
}