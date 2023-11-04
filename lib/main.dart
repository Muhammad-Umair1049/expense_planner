import 'package:flutter/material.dart';
import 'Screens/home_page.dart';
// import 'Screens/me_section.dart';
// import 'screens/sign_in.dart';

// main
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(primarySwatch: Colors.amber),
      home:
          HomePage(), //Only change this for testing screens like SignIn() or Me()
    );
  }
}
