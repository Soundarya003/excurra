import 'package:excurra/Widgets/country_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:excurra/Widgets/date.dart';
import 'package:excurra/constants.dart';
import 'package:excurra/screens/booking_screen.dart';
import 'package:excurra/Widgets/create_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:excurra/Widgets/sidemenu.dart';
import 'package:excurra/Widgets/traveller_widget.dart';

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
  late var adults = 1;
  late var children = 1;
  final user = FirebaseAuth.instance.currentUser;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      drawer: SideMenu(
        name: user?.displayName?.split(" ")[0] as String,
        email: user?.email?.split(" ")[0] as String,
        user: user?.photoURL! as String,
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFFFBFCF8),
        title: Text(
            '${'Hello '}${user?.displayName?.split(" ")[0] as String} ${'!'}',
            style: kHeading),
        toolbarHeight: 80,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: _openDrawer,
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFFBFCF8),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 330,
                    height: 500,
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
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                          Divider(
                            color: Colors.black,
                            thickness: 0.1,
                          ),
                          TravellerWidget(
                            add: () {
                              setState(() {
                                  if(adults>1000){
                                    adults = 1000;
                                  }
                                  else{
                                    adults++;
                                  }
                              });
                            },
                            subtract: () {
                              setState(() {
                                  if(adults<=1){
                                    adults = 1;
                                  }
                                  else{
                                    adults--;
                                  }
                              });
                            },
                            numberOfPassangers: '${adults}', title: 'Adults',
                          ),
                          TravellerWidget(
                            add: () {
                              setState(() {
                                if(children>1000){
                                  children = 1000;
                                }
                                else{
                                  children++;
                                }
                              });
                            },
                            subtract: () {
                              setState(() {
                                if(children<=1){
                                  children = 1;
                                }
                                else{
                                  children--;
                                }
                              });
                            },
                            numberOfPassangers: '${children}', title: 'Children',
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
            ],
          ),
        )
      ]),
    ));
  }
}
