import 'dart:convert';

import 'package:excurra/Cards/resort_card.dart';
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
  var jsonData;
  Future<void> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('json/flight_data.json');
    var data = jsonDecode(jsonString);
    setState(() {
      jsonData = data;
    });
    //print(jsonData);
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonAsset();
  }

  Widget build(BuildContext context) {
    Map<String, dynamic> accumulatedData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    List allOptions = ['tourism'];
    allOptions.addAll(accumulatedData['mustList']);
    allOptions.addAll(accumulatedData['interestList']);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Color(0xFFFBFCF8),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  color: Color(0xFFFBFCF8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey, // Border color
                            width: 2.0, // Border width
                          ),
                          color: Colors.white, // Background color
                        ),
                        child: Column(
                          children: [
                            Text(
                              'From Date:  ${accumulatedData['from_date']!}',
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              'To Date:  ${accumulatedData['to_date']!}',
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              'Number of adults:  ${accumulatedData['numberOfAdults']!}',
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              'Number of children:  ${accumulatedData['numberofChildren']!}',
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                                'Travel Preference:  ${accumulatedData['travelPreference']}',
                                style: TextStyle(color: Colors.black)),
                            Text(
                                'Budget Preference:  ${accumulatedData['budgetPreference']}',
                                style: TextStyle(color: Colors.black)),
                            Text(
                                'Food Preference:  ${accumulatedData['foodPreference']}',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        child: ListView.builder(
                          shrinkWrap: false,
                          itemCount: allOptions.length,
                          itemBuilder: (context, index) {
                            return Text(
                              'Option: ${allOptions[index]}',
                              style: TextStyle(color: Colors.black),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
