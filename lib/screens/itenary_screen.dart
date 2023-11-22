import 'dart:convert';
import 'dart:math';
import 'package:excurra/Widgets/create_button.dart';
import 'package:excurra/screens/travelHistory_screen.dart';
import 'package:excurra/services/MainAPI.dart';
import 'package:flutter/material.dart';
import 'package:excurra/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:excurra/screens/wishlist_screen.dart';
import 'package:provider/provider.dart';
import 'package:excurra/screens/welcome.dart';

class ItineraryScreen extends StatefulWidget {
  static const String id = 'itinerary_screen';

  @override
  State<ItineraryScreen> createState() => _ItineraryScreenState();
}

class _ItineraryScreenState extends State<ItineraryScreen> {
  late Map<String, dynamic> accumulatedData;
  late List<String> allOptions;
  List<List<String>> list1 = [];
  List<String> placeName = [];
  var jsonData;
  List<dynamic> mainList = [];

  late int difference;
  List<int> daysList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    accumulatedData = ModalRoute
        .of(context)
        ?.settings
        .arguments as Map<String, dynamic>;
    addAll();
    loadJsonAsset();
  }

  void addAll() {
    int total = int.parse(accumulatedData['numberOfAdults']) +
        int.parse(accumulatedData['numberofChildren']);

    int daysBetween(DateTime from, DateTime to) {
      from = DateTime(from.year, from.month, from.day);
      to = DateTime(to.year, to.month, to.day);
      return (to
          .difference(from)
          .inHours / 24).round();
    }

    final arrivalDate = DateTime(
      int.parse(accumulatedData['to_date'].toString().substring(0, 4)),
      int.parse(accumulatedData['to_date'].toString().substring(5, 7)),
      int.parse(accumulatedData['to_date'].toString().substring(8, 10)),
    );
    final deptDate = DateTime(
      int.parse(accumulatedData['from_date'].toString().substring(0, 4)),
      int.parse(accumulatedData['from_date'].toString().substring(5, 7)),
      int.parse(accumulatedData['from_date'].toString().substring(8, 10)),
    );
    difference = daysBetween(deptDate, arrivalDate);
    allOptions = [
      'tourism',
      ...accumulatedData['mustList'],
      ...accumulatedData['interestList']
    ];
  }


  Future<void> loadJsonAsset() async {
    var apiData = await MainAPI().getItinerary(
      accumulatedData['arrival_city'],
      allOptions,
      '${difference}',
      '${difference}',
      accumulatedData['travelPreference']!,
    );

    setState(() {
      int value = 2;
      jsonData = apiData;
      if(difference==2){
        mainList = jsonData['activities'];
        mainList.insert(
          mainList.length - 5,
          {
            "activity_place": "Archive",
            "activity_description": "",
            "activity_category": "",
          },
        );

        mainList.insert(
          0,
          {
            "activity_place": "Day1",
            "activity_description": "",
            "activity_category": "",
          },
        );

        mainList.insert(
          4,
          {
            "activity_place": "Day2",
            "activity_description": "",
            "activity_category": "",
          },
        );
      }
      else if(difference==1){
        mainList = jsonData['activities'];
        mainList.insert(
          mainList.length - 5,
          {
            "activity_place": "Archive",
            "activity_description": "",
            "activity_category": "",
          },
        );

        mainList.insert(
          0,
          {
            "activity_place": "Day1",
            "activity_description": "",
            "activity_category": "",
          },
        );

      }

    });
  }


  @override
  Widget build(BuildContext context) {
    if (jsonData == null) {
      return Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitWave(
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: purpleGradient,
                    ),
                  );
                },
                size: 50.0,
              ),
              SizedBox(height: 20.0),
              Text(
                "Hold on, we're weaving your perfect trip!",
                style: TextStyle(
                  color: purpleGradient.colors.last,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    void reorderData(int oldindex, int newindex) {
      setState(() {
        if (newindex > oldindex) {
          newindex -= 1;
        }
        final items = mainList.removeAt(oldindex);
        mainList.insert(newindex, items);
      });
    }




    return Scaffold(
      backgroundColor: Color(0xFFFBFCF8),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ReorderableListView(
                onReorder: reorderData,
                children: [
                  for (int index = 0; index < mainList.length; index++)
                    Card(
                      color: Colors.white,
                      key: ValueKey(index),
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: ListTile(
                          title: Text(mainList[index]['activity_place'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
                          subtitle: Text(mainList[index]['activity_description'], style: TextStyle(color: Colors.black)),
                          trailing: Text(mainList[index]['activity_category'], style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CreateButton(buttonName: 'WishList', onPressed: (){
                  print(mainList);
                  Navigator.pushNamed(context, WishlistScreen.id, arguments: mainList);
                }),
                CreateButton(buttonName: 'Travel History', onPressed: (){
                  Navigator.pushNamed(context, TravelHistoryScreen.id, arguments: mainList);
                }),
                CreateButton(buttonName: 'Home', onPressed: (){
                  Navigator.pushNamed(context, WelcomeScreen.id);
                })
              ],
            ),
          ],
        ),
      ),
    );

  }
}