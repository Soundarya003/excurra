import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
import 'package:excurra/Widgets/create_button.dart';
import 'package:excurra/constants.dart';
import 'package:excurra/screens/preference.dart';

class ChoiceScreen extends StatefulWidget {
  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
  static const String id = 'preference_screen';
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 30.0,
                        )),
                  ],
                ),
                Text('The type of travel you want'),
                SizedBox(
                  height: 15.0,
                ),
                DefaultTabController(
                  length: 4,
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Color(0xbfff5f5f7),
                        borderRadius: BorderRadius.circular(25.0)),
                    child: TabBar(
                      unselectedLabelColor: Colors.black,
                      isScrollable: true,
                      labelColor: Color(0xbff7578de),
                      labelStyle: kBookingTravelText,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: EdgeInsets.all(5.0),
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      tabs: [
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Solo"),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('Couple'),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Friends',
                            ),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                                'Family'
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text('Your Budget'),
                DefaultTabController(
                  length: 3,
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Color(0xbfff5f5f7),
                        borderRadius: BorderRadius.circular(25.0)),
                    child: TabBar(
                      unselectedLabelColor: Colors.black,
                      isScrollable: true,
                      labelColor: Color(0xbff7578de),
                      labelStyle: kBookingTravelText,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: EdgeInsets.all(5.0),
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      tabs: [
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Normal"),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('Economy'),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Luxury',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text('Food type'),
                DefaultTabController(
                  length: 2,
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Color(0xbfff5f5f7),
                        borderRadius: BorderRadius.circular(25.0)),
                    child: TabBar(
                      unselectedLabelColor: Colors.black,
                      isScrollable: true,
                      labelColor: Color(0xbff7578de),
                      labelStyle: kBookingTravelText,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: EdgeInsets.all(5.0),
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      tabs: [
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Vegetarian"),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('Non- Vegetarian'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text('Interests'),
                Align(
                  child: CreateButton(buttonName: 'Next', onPressed: () {}),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
