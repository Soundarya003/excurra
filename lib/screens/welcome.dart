import 'dart:collection';
import 'dart:convert';
import 'package:excurra/Widgets/country_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:excurra/Widgets/date.dart';
import 'package:excurra/constants.dart';
import 'package:excurra/screens/travel_screen.dart';
import 'package:excurra/Widgets/create_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:excurra/Widgets/sidemenu.dart';
import 'package:excurra/Widgets/traveller_widget.dart';
import 'package:flutter/services.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();

}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // ignore_for_file: prefer_const_constructors

  // Initial Selected Value
  List cityData = [];
  String selectedCity1 = 'New Delhi';
  String selectedCity2 = 'Mumbai';

  void swapSelectedCities() {
    setState(() {
      String? temp = selectedCity1;
      selectedCity1 = selectedCity2;
      selectedCity2 = temp;
    });
  }

  Future<String> loadCityData() async {
    return await rootBundle.loadString('json/cities.json');
  }

  Future<void> getAllCities() async {
    String data = await loadCityData();
    var jsonData = json.decode(data);
    if (mounted) {
      setState(() {
        cityData = jsonData['cities'];
      });
    }
  }

  DateTime now = DateTime.now();
  DateTime last = DateTime.now().add(Duration(days: 1));
  HashMap<String, dynamic> accumulatedData = new HashMap();

  late String from_date = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day}';
  late String to_date = '${last.year}-${last.month.toString().padLeft(2, '0')}-${last.day}';
  late var adults = 1;
  late var children = 0;
  final user = FirebaseAuth.instance.currentUser;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCities();
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
                                  width: 10.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CityDropdown(
                                    cityData: cityData,
                                    onCitySelected: (city) {
                                      setState(() {
                                        selectedCity1 = city;
                                      });
                                    },
                                    selectedCity: selectedCity1,
                                  ),
                                ),
                              ],
                            ),
                          )),
                          Container(
                            decoration: arrowDecoration(),
                            height: 44,
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: IconButton(
                                icon: Icon(
                                  Icons.compare_arrows_rounded,
                                  color: Colors.black,
                                  size: 27.0,
                                ),
                                onPressed: () {
                                  swapSelectedCities();
                                },
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
                                  width: 10.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CityDropdown(
                                    cityData: cityData,
                                    onCitySelected: (city) {
                                      setState(() {
                                        selectedCity2 = city;
                                      });
                                    },
                                    selectedCity: selectedCity2,
                                  ),
                                ),


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
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(DateTime.now().add(Duration(days: 365)).year));
                                      setState(() {
                                        if (datepicked != null) {
                                          from_date =
                                              '${datepicked.year}-${datepicked.month}-${datepicked.day}';
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
                                          initialDate: DateTime.now().add(Duration(days: 1)),  // Set initial date to two months from now
                                          firstDate: DateTime.now().add(Duration(days: 1)),       // Set the first selectable date to two months from now
                                          lastDate: DateTime.now().add(Duration(days: 60))
                                          );
                                      setState(() {
                                        if (datepicked != null) {
                                          to_date =
                                              '${datepicked.year}-${datepicked.month}-${datepicked.day}';
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
                                if (adults > 30) {
                                  adults = 30;
                                } else {
                                  adults++;
                                }
                              });
                            },
                            subtract: () {
                              setState(() {
                                if (adults <= 1) {
                                  adults = 1;
                                } else {
                                  adults--;
                                }
                              });
                            },
                            numberOfPassangers: '${adults}',
                            title: 'Adults',
                          ),
                          TravellerWidget(
                            add: () {
                              setState(() {
                                if (children > 30) {
                                  children = 30;
                                } else {
                                  children++;
                                }
                              });
                            },
                            subtract: () {
                              setState(() {
                                if (children <= 1) {
                                  children = 0;
                                } else {
                                  children--;
                                }
                              });
                            },
                            numberOfPassangers: '${children}',
                            title: 'Children',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CreateButton(
                                  buttonName: 'Continue',
                                  onPressed: () {
                                    accumulatedData.addAll(
                                      {
                                        'dept_city': selectedCity1,
                                        'arrival_city': selectedCity2,
                                        'from_date':from_date,
                                        'to_date': to_date,
                                        'numberOfAdults': '${adults}',
                                        'numberofChildren': '${children}',
                                      }
                                    );
                                    Navigator.pushNamed(
                                        context, FlightScreen.id, arguments: accumulatedData);

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
