import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/TransactionDL.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';

class RecordsScreen extends StatefulWidget {
  RecordsScreen({super.key});

  final List<Transaction> userTransactions = [];

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  @override
  Widget build(BuildContext context) {
    var userTransactions = TransactionDL.list;

    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.search_rounded,
            size: 25,
          ),
          onPressed: () {
            // Add your search action here
          },
        ),
        title: Center(
          child: Text(
            'Expense Manager',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.calendar_month_outlined,
              size: 25,
            ),
            onPressed: () {
              // Add your calendar action here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Container(
            //   width: double.infinity,
            //   child: const Card(
            //     color: Colors.lightBlue,
            //     elevation: 5,
            //     child: Text("CHART!"),
            //   ),
            // ),
            TransactionList(userTransactions),
          ],
        ),
      ),
      //Bottom Navigation Bar all functionality is added in this function
    );
  }
}
