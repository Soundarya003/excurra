import 'package:flutter/material.dart';
import 'package:excurra/Authentication/Auth.dart';
import 'package:excurra/screens/welcome.dart';
import 'package:excurra/Widgets/google_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
         backgroundColor: Colors.white,
          body: Center(child: GoogleButton(
        onPressed: () async {
          final user = await AuthService().signInWithGoogle();

          // If user is not null, navigate to the next screen
          if (user != null) {
            Navigator.pushNamed(context, WelcomeScreen.id);
          }
        },
      )),
    ));
  }
}
