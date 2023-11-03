import 'package:flutter/material.dart';

class MoneyManagerFrontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Manager'),
      ),
      body: Column(
        children: [
          // Display the user's balance
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Balance'),
                  Text('1,550'),
                ],
              ),
            ),
          ),

          // Display the user's income and expenses
          Row(
            children: [
              // Display the user's income
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('Income'),
                      Text('0'),
                    ],
                  ),
                ),
              ),

              // Display the user's expenses
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('Expenses'),
                      Text('-1,550'),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Display a list of recent transactions
          ListView(
            children: [
              // Display a recent transaction
              ListTile(
                title: Text('Biryani'),
                subtitle: Text('-200'),
                leading: Icon(Icons.food_bank),
              ),

              // Display another recent transaction
              ListTile(
                title: Text('Transportation'),
                subtitle: Text('-450'),
                leading: Icon(Icons.commute),
              ),

              // ...
            ],
          ),
        ],
      ),
    );
  }
}
