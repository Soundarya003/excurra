import 'package:excurra/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier{
     //this is feature to initiate google sign in
     final googleSignIn = GoogleSignIn();

//     then all details of user
     GoogleSignInAccount? _user;
//   getter method to get the account
     GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;
      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();
    } catch (e) {
      print("Google sign-in error: $e");
    }
  }


  Future googleLogout(BuildContext context) async {
        await googleSignIn.disconnect();
        await FirebaseAuth.instance.signOut();
        _user = null;
        notifyListeners();
        Navigator.pushNamed(context, SignInDemo.id);
      }

  Future<bool> isGoogleSignIn() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user != null && user.providerData.any((userInfo) => userInfo.providerId == 'google.com');
  }

  String? getUserIdIfSignedIn() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return user.uid; // Return the user ID
    } else {
      return null; // Return null if user is not signed in
    }}


}