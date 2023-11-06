import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Stream<User?> Function() get user => auth
      .authStateChanges; // to dynamically check the changed stages i.e profile changes

// Google Sign In
  Future<void> handleSignIn() async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        await auth.signInWithCredential(credential);
      }
    } catch (e) {
      print('Error Signing In with Google $e');
    }
  }

// Google Logout
  Future<void> handleSignOut() async {
    try {
      await _googleSignIn.signOut();
      await auth.signOut();
    } catch (e) {
      print('error signing out $e');
    }
  }

  /*// get profile pic of user
  Future<Widget> getProfilePic() async {
    if (_auth.currentUser!.photoURL != null) {
      return Image.network(_googleSignIn.currentUser!.photoUrl!, height: 100, width: 100,);
    } else {
      return Icon(Icons.account_circle, size: 100,);
    }
  }*/
// get profile pic of user
  Widget getProfilePic() {
    if (auth.currentUser!.photoURL != null) {
      return Image.network(
        auth.currentUser!.photoURL!,
        width: 60, // Adjust the width and height as needed
        height: 60,
        fit: BoxFit.cover, // You can adjust the fit to your preference
      );
    } else {
      return Icon(Icons.account_circle, size: 60);
    }
  }

  // to set profile name of a person
  Widget getProfileName() {
    if (auth.currentUser!.displayName != null) {
      return Text(
        auth.currentUser!.displayName!,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      );
    } else {
      return const Text('Anonymous');
    }
  }

  // to get profile email of a person
  Widget getProfileEmail() {
    if (auth.currentUser!.email != null) {
      return Text(
        auth.currentUser!.email!,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      );
    } else {
      return const Text('johndoe@gmail.com');
    }
  }
}
