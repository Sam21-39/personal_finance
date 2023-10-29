import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_finance/Models/expense_model.dart';

class Database {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  //creates a new  user
  Future<void> createDatabase() async {
    try {
      firestore.collection('Users').doc(auth.currentUser!.uid).set({
        "userId": auth.currentUser!.uid,
        "name": 'User',
        "budget": 0,
        "createdAt": Timestamp.now(),
        "updatedAt": Timestamp.now(),
      });
    } catch (e) {
      log(e.toString());
    }
  }

  // updates the User
  Future<void> updateDatabase(String name, double amount) async {
    try {
      firestore.collection('Users').doc(auth.currentUser!.uid).update({
        "userId": auth.currentUser!.uid,
        "name": name,
        "budget": amount,
        "createdAt": Timestamp.now(),
        "updatedAt": Timestamp.now(),
      });
    } catch (e) {
      log(e.toString());
    }
  }

  // add expenses
  Future<void> addExpense(ExpenseModel expense) async {
    try {
      firestore.collection('ExpenseList').doc().set({
        "userId": auth.currentUser!.uid,
        "expenseId": firestore.collection('ExpenseList').doc().id,
        "expense": expense.toMap(),
        "createdAt": Timestamp.now(),
        "updatedAt": Timestamp.now(),
      });
    } catch (e) {
      log(e.toString());
    }
  }

// update expenses
  Future<void> updateExpense(ExpenseModel expense, String id) async {
    try {
      firestore.collection('ExpenseList').doc(id).update({
        "userId": auth.currentUser!.uid,
        "expenseId": id,
        "expense": expense.toMap(),
        "createdAt": Timestamp.now(),
        "updatedAt": Timestamp.now(),
      });
    } catch (e) {
      log(e.toString());
    }
  }

  // delete expenses
  Future<void> deleteExpense(String id) async {
    try {
      firestore.collection('ExpenseList').doc(id).delete();
    } catch (e) {
      log(e.toString());
    }
  }
}
