import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/auth.dart';
import 'package:flutter_complete_guide/widgets/auth_screens/login_page.dart';
import 'package:flutter_complete_guide/widgets/settings/modal_bottom_sheet.dart';

import '../../services/auth_service.dart';

class HelloScreen extends StatefulWidget {
  @override
  _HelloScreenState createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  Widget build(BuildContext context) {

    AuthService authService = AuthService();
    var bottomSheet = ModalBottomSheet();

    // Sign out the current user
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AuthPage(),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Hello'),
              ),
            );
          },
          child: AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: StreamBuilder<User?>(
              stream: authService.auth.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  final user = snapshot.data;

                  if (user != null) {
                    // User is logged in, update the UI with user data
                    return Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                          radius: 30,
                          child: ClipOval(
                            child: Image.network(
                              user.photoURL ?? '',
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.displayName ?? "Anonymous",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              user.email ?? "johndoe@gmail.com",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    // User is logged out
                    return Text("Not logged in");
                  }
                } else if (snapshot.hasError) {
                  // Handle errors here, e.g., display an error message
                  return Text("Error: ${snapshot.error}");
                } else {
                  // Loading state
                  return Text("Loading...");
                }
              },
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Container(
              width: 300.0,
              child: ElevatedButton(
                onPressed: () {
                  // Add your custom logic here for the Premium button
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.star, // Replace with your crown icon
                        color: Colors.orange, // Icon color
                        size: 24, // Icon size
                      ),
                    ),
                    Text(
                      'Premium Member',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(), // Adds spacing to push the ">" icon to the right
                    Icon(
                      Icons.chevron_right, // ">" icon
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10), // Add some spacing
          Center(
            child: Container(
              width: 300.0,
              child: ElevatedButton(
                onPressed: () {
                  // _showBottomSheet(context);
                  bottomSheet.showBottomSheet(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.settings, // Replace with your icon
                        color: Colors.orangeAccent, // Icon color
                        size: 24, // Icon size
                      ),
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(), // Adds spacing to push the ">" icon to the right
                    Icon(
                      Icons.chevron_right, // ">" icon
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
