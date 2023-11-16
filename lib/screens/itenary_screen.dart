import 'dart:convert';

import 'package:excurra/Cards/resort_card.dart';
import 'package:excurra/services/MainAPI.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
import 'package:excurra/constants.dart';
import 'package:excurra/Cards/flight_card.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:excurra/Cards/hostel_card.dart';

class ItineraryScreen extends StatefulWidget {
  @override
  State<ItineraryScreen> createState() => _ItineraryScreenState();
  static String id = 'itinerary_screen';
}

class _ItineraryScreenState extends State<ItineraryScreen> {
  @override
  late Map<String, dynamic> accumulatedData ;
  late int total = 0;
  late int difference = 0;
  List<String> allOptions = ['tourism'];
  void didChangeDependencies() {
    super.didChangeDependencies();
    accumulatedData = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    addAll();
    loadJsonAsset();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void addAll(){
    total = int.parse(accumulatedData['numberOfAdults']) + int.parse(accumulatedData['numberofChildren']);

    int daysBetween(DateTime from, DateTime to) {
      from = DateTime(from.year, from.month, from.day);
      to = DateTime(to.year, to.month, to.day);
      return (to.difference(from).inHours / 24).round();
    }

    final arrivalDate = DateTime(int.parse(accumulatedData['to_date'].toString().substring(0,4)),
        int.parse(accumulatedData['to_date'].toString().substring(5,7)),
        int.parse(accumulatedData['to_date'].toString().substring(8,10)));
    final deptDate = DateTime(int.parse(accumulatedData['from_date'].toString().substring(0,4)),
        int.parse(accumulatedData['from_date'].toString().substring(5,7)),
        int.parse(accumulatedData['from_date'].toString().substring(8,10)));
     difference = daysBetween(deptDate, arrivalDate);

    for (String i in accumulatedData['mustList']){
           allOptions.add(i);
    }
    for (String i in accumulatedData['interestList']){
      allOptions.add(i);
    }
  }
  var jsonData;
  Future<void> loadJsonAsset() async {
    var apiData = await MainAPI().getItinerary(accumulatedData['arrival_city'], allOptions, '${difference}', '${total}',
        accumulatedData['travelPreference']!);
    setState(() {
      jsonData = apiData;
    });
    //print(jsonData);
  }

  Widget build(BuildContext context) {
    if (jsonData == null) {
      return Center(child: CircularProgressIndicator());
    }
    var activities = jsonData['activities'];
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color(0xFFFBFCF8),
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: activities.length,
            itemBuilder: (context, index) {
              var activity = activities[index];
              return ListTile(
                title: Text(activity['activity_place'], style: TextStyle(color: Colors.black),),
                subtitle: Text(activity['activity_description'], style: TextStyle(color: Colors.black),),
              );
            },
          ),
        ),
      ),
    );
  }
}
