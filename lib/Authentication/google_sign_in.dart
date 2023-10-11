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

     Future googleLogin() async{
        final googleUser = await googleSignIn.signIn();
        if(googleUser == null) return;
        _user= googleUser;
        final googleAuth =  await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        notifyListeners();
     }
}