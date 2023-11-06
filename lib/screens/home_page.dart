import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../models/transaction.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';
import 'me_screen/me.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      //Bottom Navigation Bar all functionality is added in this function
      bottomNavigationBar: CurvedNavigationBar(
        // I use the package from PUB.dev "curved_navigation_bar"
        backgroundColor: Colors
            .amber, // You can change the color of the bottom navigation bar
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        height: 60,
        animationDuration:
            Duration(milliseconds: 250), // You can change the animation speed
        items: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.document_scanner_rounded,
                size: 25,
              ),
              Text("Records", style: TextStyle(fontSize: 12)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle_outline_outlined,
                size: 50,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_circle_rounded,
                size: 25,
              ),
              Text("Me", style: TextStyle(fontSize: 12)),
            ],
          )
        ],
        onTap: (index) {
          // onpresssed function like if user tap on add icon then it will open the add transaction bottom sheet
          if (index == 1) {
            _startAddNewTransaction(context);
          } else if (index == 2) {
            // if user tap on account icon then it will open the me.dart screen
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HelloScreen(),
              ),
            );
          }
        },
      ),
    );
  }
}
