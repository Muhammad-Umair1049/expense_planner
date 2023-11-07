import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_complete_guide/TransactionDL.dart';
import '../models/transaction.dart';
import '../widgets/new_transaction.dart';
import 'me_screen/me.dart';
import 'records.dart';

var list = [
  RecordsScreen(),
  HelloScreen(),
];
int _index = 0;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      TransactionDL.list.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: list[_index],
      bottomNavigationBar: CurvedNavigationBar(
        // I use the package from PUB.dev "curved_navigation_bar
        // You can change the color of the bottom navigation bar
        backgroundColor: isDarkMode ? Colors.white : Colors.amber,
        color: isDarkMode ? Color.fromARGB(255, 77, 76, 76) : Colors.white,
        buttonBackgroundColor:
            isDarkMode ? Color.fromARGB(255, 77, 76, 76) : Colors.white,
        height: 60,
        animationDuration:
            Duration(milliseconds: 250), // You can change the animation speed
        items: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.document_scanner_rounded,
                color: isDarkMode ? Colors.white : Colors.black,
                size: 25,
              ),
              Text(
                "Records",
                style: TextStyle(
                    fontSize: 12,
                    color: isDarkMode ? Colors.white : Colors.black),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle_outline_outlined,
                color: isDarkMode ? Colors.white : Colors.black,
                size: 50,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_circle_rounded,
                color: isDarkMode ? Colors.white : Colors.black,
                size: 25,
              ),
              Text(
                "Me",
                style: TextStyle(
                  fontSize: 12,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ],
          )
        ],
        onTap: (index) {
          if (index == 0) {
            _index = index;
            setState(() {});
          } else if (index == 2) {
            _index = 1;
            setState(() {});
          } else {
            _startAddNewTransaction(context);
          }
        },
      ),
    );
  }
}
