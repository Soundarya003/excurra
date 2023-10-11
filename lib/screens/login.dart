import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:excurra/Authentication/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:excurra/screens/welcome.dart';

class SignInDemo extends StatelessWidget {
  const SignInDemo({Key? key}) : super(key: key);
  static const String id = 'login_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: ElevatedButton.icon(
                onPressed: () {
                  final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();

                },
                icon: FaIcon(FontAwesomeIcons.google),
                label: Text('Sign up with Google'),
                style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50)
            ),
            ),
          ),
        ),
      ),
    );
  }
}


