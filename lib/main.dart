import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/auth.dart';
import 'package:flutter_complete_guide/widgets/auth_screens/login_page.dart';
import 'widgets/settings/me.dart';
import 'widgets/auth_screens/sign_in.dart';
import 'widgets/new_transaction.dart';
import 'widgets/transaction_list.dart';
import 'models/transaction.dart';
import 'screens/homePage.dart';
import 'Models/rive.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

//AIzaSyCY9AzhXJbjSSPnYhv6UTTXG0y5wTbOiZY
//1:1036775824586:android:43bb5149656fe235b0a833
//1036775824586
//expense-tracker-flutter-251e2
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
            apiKey: "AIzaSyCY9AzhXJbjSSPnYhv6UTTXG0y5wTbOiZY",
            appId: "1:1036775824586:android:43bb5149656fe235b0a833",
            messagingSenderId: "1036775824586",
            projectId: "expense-tracker-flutter-251e2",
          ),
        )
      : await Firebase.initializeApp();
  runApp(MyApp());
}
// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(primarySwatch: Colors.yellow),
      // home: MyHomePage(
      //   key: const Key('MyHomePage'), // Adding the named 'key' parameter here
      // ),
      // home: AuthPage(),
      home: HelloScreen(),


      // theme: ThemeData(primarySwatch: Colors.purple),
      // home: MyHomePage(
      //   key: const Key('MyHomePage'), // Adding the named 'key' parameter here
      // ),
      // home: MoneyManagerFrontPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // Adding the named 'key' parameter here
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
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

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: const Card(
                color: Colors.lightBlue,
                elevation: 5,
                child: Text("CHART!"),
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () => _startAddNewTransaction(context),
      // ),
    );
  }
}
