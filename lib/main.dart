import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/screens/home_page.dart';
import 'package:flutter_complete_guide/themes/theme_constants.dart';
import 'package:flutter_complete_guide/themes/theme_manager.dart';

// These are important lines related to firebase present in Android app [google-serivces.json]
/*AIzaSyCY9AzhXJbjSSPnYhv6UTTXG0y5wTbOiZY
1:1036775824586:android:43bb5149656fe235b0a833
1036775824586
expense-tracker-flutter-251e2*/
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Set the status bar color to transparent
  ));
  
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
ThemeManager themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',

      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
      home:  HomePage(), 
    );
  }
}
