import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_finance/Utils/constatns.dart';

class AuthServices {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String> signUpAuth(String email, String password) async {
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      log(result.user!.uid);
      return SUCCESS;
    } catch (e) {
      log(e.toString());
      if (e.toString().contains('email-already-in-use')) {
        return EMAIL_IN_USE;
      }
      return FAILURE;
    }
  }

  Future<String> signInAuth(String email, String password) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      log(result.user!.uid);
      return SUCCESS;
    } catch (e) {
      log(e.toString());
      if (e.toString().contains("INVALID_LOGIN_CREDENTIALS")) {
        return INVALID_LOGIN_CREDENTIALS;
      }
      return FAILURE;
    }
  }

  Future<void> signout() async {
    await firebaseAuth.signOut();
  }
}
