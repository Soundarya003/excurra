import 'package:excurra/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:excurra/screens/booking_screen.dart';
import 'package:flutter/services.dart';
import 'package:excurra/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:excurra/screens/hotel_screen.dart';

void main() async{
  // this is to ensure our app stays in landscape mode even if it's in auto rotation
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: LoginScreen.id,
      routes: {
        WelcomeScreen.id: (context)=> WelcomeScreen(),
        BookingScreen.id: (context) => BookingScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        HotelScreen.id : (context) => HotelScreen(),
      },
    );
  }
}

