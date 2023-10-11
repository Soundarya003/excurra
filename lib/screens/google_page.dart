import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:excurra/screens/welcome.dart';
import 'package:excurra/screens/login.dart';


class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  static const String id = 'homePage_screen';

  @override
  Widget build(BuildContext context) => Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          else if (snapshot.hasError){
            return Center(child: Text('Something went wrong'),);
          }
          else if(snapshot.hasData){
            return WelcomeScreen();
          }
          else{
             return SignInDemo();
          }
      },
      ),
  );
}
