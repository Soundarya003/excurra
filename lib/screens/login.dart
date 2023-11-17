import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:excurra/Authentication/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:excurra/constants.dart';
import 'package:excurra/screens/welcome.dart';

class SignInDemo extends StatelessWidget {
  const SignInDemo({Key? key}) : super(key: key);
  static const String id = 'login_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Text(
                  'EXCURRA',
                  style: TextStyle(fontSize: 75, color: Color(0xFFCE4263), fontFamily: 'OpenSans_Condensed-SemiBold', fontWeight: FontWeight.w700),
                ),
                Positioned(
                  bottom: 2,
                  right: 4, // Adjust the value to set the gap between the texts
                  child: Text(
                    'EXCURRA',
                    style: TextStyle(fontSize: 75, color: Color(0xFF6228D7),fontFamily: 'OpenSans_Condensed-SemiBold', fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            Text('THE ONLY PLANNER YOU NEED', style: TextStyle(fontSize: 18, color: Color(0xFFCB6CE6), fontFamily: 'Rubik-Black', fontWeight: FontWeight.w700) ,),
            SizedBox(height: 15,),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                    await provider.googleLogin();
                    if (await provider.isGoogleSignIn()){
                      Navigator.pushReplacementNamed(context, WelcomeScreen.id);
                    }
                  },
                  icon: GradientIcon(icon: FontAwesomeIcons.google, size: 25),
                  label: Text('Sign up with Google'),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      side: BorderSide(color: Colors.grey)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


