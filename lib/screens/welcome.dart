import 'package:excurra/Widgets/country_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:excurra/Widgets/date.dart';
import 'package:excurra/constants.dart';
import 'package:excurra/screens/booking_screen.dart';
import 'package:excurra/Widgets/create_button.dart';
import 'package:excurra/Widgets/profile.dart';
import 'package:excurra/Widgets/menu.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // ignore_for_file: prefer_const_constructors
  // Initial Selected Value
  String from_country = 'Option 1';
  String to_country = 'Option 2';
  late String from_date = '30-08-2023';
  late String to_date = '10-09-2023';
  final user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey,
          body: SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ResizeImage(AssetImage("images/bg3.jpg"),
                        width: 900, height: 900),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(user?.photoURL! as String)
                              ),
                               SizedBox(width: 20.0,),
                              Text('${'Hello '}${user?.displayName?.split(" ")[0]  as String}', style: kHeading),
                            ],
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.menu,
                                color: Colors.black,
                                size: 30,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 330,
                          height: 400,
                          decoration: mainBoxDecoration(),
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.flight_takeoff,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 25.0,
                                      ),
                                      CreateDropDown(
                                        dropdownvalue: from_country,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            from_country = newValue!;
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                )),
                                Container(
                                  decoration: arrowDecoration(),
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        String temp = from_country;
                                        from_country = to_country;
                                        to_country = temp;
                                      });
                                    },
                                    child: RotatedBox(
                                      quarterTurns: 1,
                                      child: Icon(
                                        Icons.compare_arrows_rounded,
                                        color: Colors.black,
                                        size: 30.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.flight_land,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 25.0,
                                      ),
                                      CreateDropDown(
                                        dropdownvalue: to_country,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            to_country = newValue!;
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                )),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Divider(
                                  color: Colors.black,
                                  thickness: 0.1,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.date_range_outlined,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 25.0,
                                      ),
                                      CreateDate(
                                          destinationName: 'From',
                                          onPressed: () async {
                                            DateTime? datepicked =
                                                await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(2023),
                                                    lastDate: DateTime(2024));
                                            setState(() {
                                              if (datepicked != null) {
                                                from_date =
                                                    '${datepicked.day}-${datepicked.month}-${datepicked.year}';
                                              }
                                            });
                                          },
                                          currentDate: from_date),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      CreateDate(
                                          destinationName: 'To',
                                          onPressed: () async {
                                            DateTime? datepicked =
                                                await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(2023),
                                                    lastDate: DateTime(2024));
                                            setState(() {
                                              if (datepicked != null) {
                                                to_date =
                                                    '${datepicked.day}-${datepicked.month}-${datepicked.year}';
                                                print(to_date);
                                              }
                                            });
                                          },
                                          currentDate: to_date),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CreateButton(
                                        buttonName: 'Continue',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, BookingScreen.id);
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 230.0,
                    )
                  ],
                )),
          )),
    );
  }
}
