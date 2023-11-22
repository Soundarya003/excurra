import 'package:excurra/Authentication/google_sign_in.dart';
import 'package:excurra/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:excurra/screens/travel_screen.dart';
import 'package:flutter/services.dart';
import 'package:excurra/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:excurra/screens/accommodation_screen.dart';
import 'package:excurra/screens/preference.dart';
import 'package:provider/provider.dart';
import 'package:excurra/screens/google_page.dart';
import 'package:excurra/screens/itenary_screen.dart';
import 'package:excurra/screens/splash_screen.dart';
import 'package:excurra/screens/wishlist_screen.dart';
import 'package:excurra/screens/travelHistory_screen.dart';

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
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
    child : MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: SplashScreen.id,
      routes: {
        WelcomeScreen.id: (context)=> WelcomeScreen(),
        FlightScreen.id: (context) => FlightScreen(),
        SignInDemo.id: (context) => SignInDemo(),
        AccomodationScreen.id : (context) => AccomodationScreen(),
        Homepage.id : (context) => Homepage(),
        ChoiceScreen.id: (context) => ChoiceScreen(),
        ItineraryScreen.id: (context) => ItineraryScreen(),
        SplashScreen.id :(context) => SplashScreen(),
        WishlistScreen.id : (context) => WishlistScreen(),
        TravelHistoryScreen.id :(context) => WishlistScreen()
      },
    ),
  );
}

