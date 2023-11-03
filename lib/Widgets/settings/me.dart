import 'package:flutter/material.dart';

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

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: InkWell(
          onTap: () {
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
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      radius: 30,
                      child: Icon(Icons.person, size: 32),
                    ),
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
