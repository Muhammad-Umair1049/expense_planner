import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/auth.dart';
import 'package:flutter_complete_guide/widgets/auth_screens/login_page.dart';

import '../../services/auth_service.dart';

class HelloScreen extends StatefulWidget {
  @override
  _HelloScreenState createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  Widget build(BuildContext context) {
    // Function to show a modal bottom sheet
    void _showModalBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (_) {
          return Column(
            children: [
              // App Bar with a "Settings" heading
              AppBar(
                title: Text('Settings'),
              ),
              // Profile button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your logic for the Profile button here
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.chevron_right,
                        size: 24,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              // Themes button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your logic for the Themes button here
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.color_lens,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                      Text(
                        'Themes',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.chevron_right,
                        size: 24,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              // Font Size button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your logic for the Font Size button here
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.format_size,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                      Text(
                        'Font Size',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.chevron_right,
                        size: 24,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

    AuthService authService = AuthService();
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
            title: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // I added this code to dynamically change the profile pic according to changes in accounts
                    StreamBuilder<User?>(
                      stream: authService.auth.authStateChanges(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.active) {
                          if (snapshot.hasData) {
                            // User is logged in, return the circular profile picture
                            return CircleAvatar(
                              backgroundColor: Colors.grey,
                              foregroundColor: Colors.white,
                              radius: 30,
                              child: ClipOval(
                                child: Image.network(
                                  snapshot.data!.photoURL ?? '',
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          } else {
                            // User is logged out, return the default icon or a sign-in button
                            return Icon(Icons.account_circle, size: 60);
                          }
                        } else {
                          // You can return a loading indicator or any other widget while the connection state is not active
                          return CircularProgressIndicator();
                        }
                      },
                    ),

                    /* CircleAvatar(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      radius: 30,
                      // child: Icon(Icons.person, size: 32),
                      child: ClipOval(
                        child: authService.getProfilePic(),
                      )
                    ),*/
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Sign in, more exciting!',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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
                  _showModalBottomSheet(context);
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
