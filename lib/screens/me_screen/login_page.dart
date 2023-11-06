import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/services/auth_service.dart';

import 'me_modal_bottom_sheet.dart';

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
          /*onPressed: authService.handleSignIn,*/
          onPressed: () {
            showCustomFullScreenModal(context);         // show_modal_bottom_sheet functionality here
          },
          child: const Text('Sign In with Google'),
        ),
      ),
    );
  }
}
