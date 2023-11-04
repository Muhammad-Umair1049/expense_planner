import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   bottomNavigationBar: CurvedNavigationBar(
    //     animationDuration: Duration(milliseconds: 250),
    //     onTap: (index) {
    //       if (index == 0) {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) => homePage()),
    //         );
    //       }
    //     },
    //     items: [
    //       Icon(Icons.document_scanner_rounded),
    //       Icon(Icons.add_box_rounded),
    //       Icon(Icons.account_circle_rounded)
    //     ],
    //   ),
    // );
    AuthService authService = AuthService();
    return Scaffold(
    appBar: AppBar(
        actions: [
          IconButton(
            onPressed: authService.handleSignOut,
            icon: Icon(Icons.logout),
          ),
        ],
        centerTitle: true,
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Text(FirebaseAuth.instance.currentUser!.email.toString()),
      ),
    );
  }
}
