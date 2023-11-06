import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign In'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: authService.handleSignIn,
          child: const Text('Sign In with Google'),
        ),
      ),
    );
  }
}
