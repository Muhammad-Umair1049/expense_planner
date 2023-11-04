import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/themes/theme_constants.dart';
import 'package:flutter_complete_guide/themes/theme_manager.dart';
import 'Screens/home_page.dart';
// import 'Screens/me_section.dart';
// import 'screens/sign_in.dart';

// main
void main() => runApp(MyApp());

ThemeManager themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
      // theme: ThemeData(primarySwatch: Colors.amber),
      home:
          HomePage(), //Only change this for testing screens like SignIn() or Me()
    );
  }
}
