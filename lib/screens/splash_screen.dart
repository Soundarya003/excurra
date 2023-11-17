import 'package:flutter/material.dart';
import 'package:excurra/screens/login.dart';
import 'package:excurra/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:excurra/screens/welcome.dart';
import 'package:excurra/screens/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
  static String id = 'splash_screen';
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _lineAnimation;
  late Animation<Color?> _splashColorAnimation;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 6),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _slideAnimation = Tween<double>(begin: -100.0, end: 0.0).animate(_controller);
    _lineAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.repeat();
    _controller.forward();

    Future.delayed(Duration(seconds: 8), () async {
      if (await isGoogleSignIn()) {
        // User is signed in with Google
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
      } else {
        // User is not signed in with Google
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInDemo()));
      }
    });
  }

  // Function to check if the user is signed in with Google
  Future<bool> isGoogleSignIn() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user != null && user.providerData.any((userInfo) => userInfo.providerId == 'google.com');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFCF8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _fadeAnimation.value,
                      child: Transform.translate(
                        offset: Offset(_slideAnimation.value, 0.0),
                        child: Text(
                          'EXCURRA',
                          style: kSplashText1,
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 2,
                  right: 4,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _fadeAnimation.value,
                        child: Transform.translate(
                          offset: Offset(-_slideAnimation.value, 0.0),
                          child: Text(
                            'EXCURRA',
                            style: kSplashText2,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width * _lineAnimation.value,
                  decoration: BoxDecoration(
                    gradient: purpleGradient
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

