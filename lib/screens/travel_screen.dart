import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
import 'package:excurra/Widgets/create_button.dart';
import 'package:excurra/constants.dart';
import 'package:excurra/screens/hotel_screen.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:excurra/travel_list/flight_working.dart';
import 'package:excurra/travel_list/bus_working.dart';
import 'package:excurra/travel_list/train_working.dart';

class FlightScreen extends StatefulWidget {
  static const String id = 'flight_screen';

  @override
  State<FlightScreen> createState() => _FlightScreenState();
}

class _FlightScreenState extends State<FlightScreen> with TickerProviderStateMixin{

  

  @override
  Widget build(BuildContext context) {
    final Map<String, String> accumulatedData = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 50,
          leading:  TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30.0,
              )),
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Color(0xbff7578de),
            labelStyle: kBookingTravelText,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.all(5.0),
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xbfff5f5f7)),
            tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Flights"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Train'),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Bus',
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
           FlightWorking(accumulatedData: accumulatedData,), TrainWorking(),
            BusWorking()
          ],
        ),
      ),
    );
  }


}
