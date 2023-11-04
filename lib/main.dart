import 'package:flutter/material.dart';
import 'Screens/home_page.dart';
// import 'screens/me.dart';
// import 'screens/sign_in.dart';

// main
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: HomePage(), //Only change this for screens like SignIn() or Me()
    );
  }
}
