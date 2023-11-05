import 'package:flutter/material.dart';
import 'themes/theme_constants.dart';
import 'themes/theme_manager.dart';
import 'screens/home_page.dart';

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
      home:
          HomePage(), //Only change this for testing screens like SignIn() or Me()
    );
  }
}
