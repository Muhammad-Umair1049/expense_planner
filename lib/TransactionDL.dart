import 'package:flutter_complete_guide/models/transaction.dart';

class TransactionDL {
  static var list = [
    Transaction(
      id: "t1",
      title: "New Shoes",
      amount: 99.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Weekly Groceries",
      amount: 59.99,
      date: DateTime.now(),
    ),
  ];
  
  static void addTransaction(var v) {
    list.add(v);
  }
}
