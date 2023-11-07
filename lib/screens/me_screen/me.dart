import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/me_screen/auth.dart';
import '../../services/auth_service.dart';
import '../../widgets/modal_bottom_sheets.dart';

class HelloScreen extends StatefulWidget {
  @override
  _HelloScreenState createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  AuthService authService = AuthService();


  /*bool isLoggingOut = false;
  Future<void> handleLogout() async {
    setState(() {
      isLoggingOut = true;
    });

    await authService.handleSignOut(); // Call your logout method

    setState(() {
      isLoggingOut = false;
    });
  }*/

  @override
  Widget build(BuildContext context) {
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
            // show snackbar message that the user pressed on appbar
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
                      mainAxisAlignment: MainAxisAlignment.start,
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
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Text(
                              user.email ?? "johndoe@gmail.com",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(
                            Icons.logout,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            authService.handleSignOut();    // user sign out functionality here
                          },
                        ),
                       /* isLoggingOut
                            ? CircularProgressIndicator()
                            : IconButton(
                          icon: Icon(
                            Icons.logout,
                            color: Colors.black,
                          ),
                          onPressed: handleLogout,
                        ),*/
                      ],
                    );
                  } else {
                    // User is logged out
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black54,
                          foregroundColor: Colors.white,
                          radius: 30,
                          child: ClipOval(
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // user?.displayName ?? "Anonymous",
                              "Sign In",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Text(
                              // user?.email ?? "johndoe@gmail.com",
                              "Can't wait, Signing In!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                        /* Spacer(),
                        Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.login,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                authService.handleSignIn();
                              },
                            ),
                            const Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),*/
                      ],
                    );
                    // return Text("Not logged in");
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
                  showSettingsBottomSheet(context);
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
