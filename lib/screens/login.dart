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
                  style: kSplashText1,
                ),
                Positioned(
                  bottom: 2,
                  right: 4, // Adjust the value to set the gap between the texts
                  child: Text(
                    'EXCURRA',
                    style: kSplashText2,
                  ),
                ),
              ],
            ),
            Text('THE ONLY PLANNER YOU NEED', style: kSubSplash ,),
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


