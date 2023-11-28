import 'dart:developer';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excurra/Widgets/create_button.dart';
import 'package:excurra/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:excurra/Cards/flight_card.dart';
import 'package:excurra/Cards/hotel_card.dart';
import 'package:excurra/Cards/train_card.dart';
import 'package:excurra/Cards/bus_card.dart';
import 'package:excurra/Cards/hostel_card.dart';
import 'package:excurra/Cards/resort_card.dart';

class TravelHistory extends StatefulWidget {
  const TravelHistory({Key? key}) : super(key: key);
  static const String id = 'travel_screen';

  @override
  State<TravelHistory> createState() => _TravelHistoryState();
}

class _TravelHistoryState extends State<TravelHistory> {
  void initState() {
// TODO: implement initState
    fetchData();
    super.initState();
  }

  final user = FirebaseAuth.instance.currentUser;
  late List<String> resultList;
//   final List<Map<String, String>> mainList = [
//     {
//       'activity_place': 'Park',
//       'activity_description': 'Enjoy a day at the park',
//       'activity_category': 'Outdoor',
//     },
//     {
//       'activity_place': 'Museum',
//       'activity_description': 'Explore historical artifacts',
//       'activity_category': 'Indoor',
//     },
// // Add more items as needed
//   ];

  late List<String> arrivalCity = [];
  late List<String> deptCity = [];
  late List<String> interests = [];
  late List<String> fromDate = [];
  late List<String> toDate = [];
  late List<Map<String, dynamic>> dummyList = [];
  late List<dynamic> mustList = [];
  late List<Map<String, dynamic>> travelList = [];
  late List<Map<String, dynamic>> stayList = [];
  late List<String> stayType = [];
  late List<String> travelType = [];

  Future<void> fetchData() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference collectionRef = FirebaseFirestore.instance
          .collection('Usersss')
          .doc('${user?.uid}')
          .collection('travel_history');
      QuerySnapshot querySnapshot = await collectionRef.get();

      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        interests.add(doc.get('interests'));
        arrivalCity.add(doc.get('arrival_city'));
        deptCity.add(doc.get('dept_city'));
        mustList.add(doc.get('itinerary'));
        fromDate.add(doc.get('fromDate'));
        toDate.add(doc.get('toDate'));
        travelList.add(doc.get('modeOfTransport'));
        stayList.add(doc.get('modeOfAccommodation'));
        stayType.add(doc.get('stayType'));
        travelType.add(doc.get('travelType'));
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
    print(stayType);
    print(travelType);
    print(deptCity);
    print(arrivalCity);
    print(stayList);
    print(travelList);
    print(interests);
    print(arrivalCity);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final List<dynamic> mainList = ModalRoute.of(context)?.settings.arguments as List<dynamic>;

    if (mustList == null) {
      return Center(child: CircularProgressIndicator());
    }
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: arrivalCity.length,
                        itemBuilder: (context, index) {
                          String place = arrivalCity[index];
                          String interest = interests[index];
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DataScreen(
                                    mainList: mustList[index],
                                    fromDate: fromDate[index],
                                    toDate: toDate[index], travelList: travelList[index],
                                    stayList: stayList[index],
                                    arrivalCity: arrivalCity[index],
                                    deptCity: deptCity[index], travelType: travelType[index], stayType: stayType[index],
                                  ),
                                ),
                              );
                            },
                            title: Text(
                              '${place} (${fromDate[index]} - ${toDate[index]}) \n${interest}',
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        })),
                Center(
                  child: CreateButton(
                      buttonName: 'Home',
                      onPressed: () {
                        Navigator.pushNamed(context, WelcomeScreen.id);
                      }),
                ),
              ],
            ),
          )),
    );
  }
}

class DataScreen extends StatelessWidget {
  static const String id = 'data_screen';
  late List<dynamic> mainList;
  late String arrivalCity;
  late String deptCity;
  late String fromDate;
  late String toDate;
  late Map<String, dynamic> travelList = new Map<String,dynamic>();
  late Map<String, dynamic> stayList = new Map<String,dynamic>();
  late String travelType;
  late String stayType;
  DataScreen(
      {required this.mainList, required this.fromDate, required this.toDate, required this.travelList
        , required this.stayList, required this.arrivalCity, required this.deptCity, required this.travelType,
        required this.stayType
      });

  Widget returnTransport(String transport) {
    print(stayList);
    if (transport == 'flight') {
      bool isThere1 = travelList['flightDetails'][0]['nonStop']=='true';
      bool isThere2 = travelList['flightDetails'][1]['nonStop']=='true';
      return FlightCard(
        cost: travelList['totalAmount'].toString(),
        toDest1: arrivalCity,
        toTime1: travelList['flightDetails'][0]['arrivalTime'].toString().substring(11,16),
        fromDest1: deptCity,
        fromTime1: travelList['flightDetails'][0]['deptTime'].toString().substring(11,16),
        flightName1: travelList['flightDetails'][0]['airlineNames'][0],
        journeyTime1: travelList['flightDetails'][0]['duration'],
        nonStop1: isThere1,
        flightName2: travelList['flightDetails'][1]['airlineNames'][0],
        fromDest2: arrivalCity,
        fromTime2: travelList['flightDetails'][1]['deptTime'].toString().substring(11,16),
        journeyTime2: travelList['flightDetails'][1]['duration'],
        nonStop2: isThere2,
        toDest2: deptCity,
        toTime2: travelList['flightDetails'][1]['arrivalTime'].toString().substring(11,16),
        stopOver1: isThere1 ? ' ': travelList['flightDetails'][0]['stopoverAirports'][0],
        stopOver2: isThere2 ? ' ': travelList['flightDetails'][1]['stopoverAirports'][0],
        selected: false,
        onSelect: (bool selected) {
          // Do nothing
        },
      );
    }
    else if (transport == 'train'){
      return TrainCard(
        deptTime1: travelList['train_details'][0]['deptTime'],
        arrivalTime1: travelList['train_details'][0]['arrivalTime'],
        trainCode1: travelList['train_details'][0]['trainCode'],
        journeyTime1: travelList['train_details'][0]['duration'],
        deptTime2: travelList['train_details'][1]['deptTime'],
        journeyTime2: travelList['train_details'][1]['duration'],
        arrivalTime2: travelList['train_details'][1]['arrivalTime'],
        trainCode2: travelList['train_details'][1]['trainCode'],
        trainName1: travelList['train_details'][0]['trainName'],
        trainName2: travelList['train_details'][1]['trainName'],
        cost: travelList['total_amount'],
        fromDest1: deptCity,
        toDest1: arrivalCity,
        fromDest2: arrivalCity,
        toDest2:  deptCity,
        selected: false,
        onSelect: (bool ) {  }
      );
    }
    else if(transport == 'bus'){
      return  BusCard(
        fromDest1: deptCity,
        toDest1: arrivalCity,
        arrivalTime1: travelList['bus_details'][0]['arrivalTime'],
        deptTime1: travelList['bus_details'][0]['deptTime'],
        busCode1: travelList['bus_details'][0]['busCode'],
        busName1: travelList['bus_details'][0]['busName'],
        duration1: travelList['bus_details'][0]['duration'],
        fromDest2:  arrivalCity,
        toDest2: deptCity,
        arrivalTime2: travelList['bus_details'][1]['arrivalTime'],
        deptTime2: travelList['bus_details'][1]['deptTime'],
        busCode2: travelList['bus_details'][1]['busCode'],
        busName2: travelList['bus_details'][1]['busName'],
        duration2: travelList['bus_details'][1]['duration'],
        cost: travelList['total_amount'],
        selected: false,
        onSelect: (bool ) {

        },
      );
    }
    else {
      return Card();
    }
  }

  Widget returnStay(String accommodation){
    int randomInt = Random().nextInt(5) + 1;

    if(accommodation== 'hotel'){
      return HotelCard(
        hotelName: stayList['hotelName'],
        hotelLocation: stayList['hotelLocation'],
        perks: stayList['perks'],
        meals: stayList['meals'],
        rating: stayList['rating'],
        totalAmount: stayList['totalAmount'],
        imageNumber: randomInt,
        selected: false,
        onSelect: (bool selected) {
        },
      );
    }
    else if( accommodation == 'resort'){
      return ResortCard(
        resortName: stayList['resortName'],
        resortLocation: stayList['resortLocation'],
        perks: stayList['perks'],
        meals: stayList['meals'],
        rating: stayList['rating'],
        totalAmount: stayList['totalAmount'],
        imageNumber:  randomInt,
        selected: false,
        onSelect: (bool selected) {
        },
      );
    }
    else if(accommodation=='hostel'){
      return HostelCard(
        hostelName: stayList['hostelName'],
        hostelLocation: stayList['hostelLocation'],
        meals: stayList['meals'],
        rating: stayList['rating'],
        totalAmount: stayList['totalAmount'],
        imageNumber: randomInt,
        selected: false,
        onSelect: (bool selected) {

        },
      );
    }
    else{
      return Card();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Travel Details',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 25.0,
                    ),
                  ),
                  returnTransport(travelType),
                  Text('Accommodation Details', style: TextStyle(
                    color: Colors.purple,
                    fontSize: 25.0,
                  ),),
                  returnStay(stayType),
                  SizedBox(height: 45.0,),
                  Text(
                    'Itinerary <3',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 30.0,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: mainList.length,
                    itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.white,
                    child: ListTile(
                      title: Text(mainList[index]['activity_place'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                      subtitle: Text(mainList[index]['activity_description'],
                          style: TextStyle(color: Colors.black)),
                      trailing: Text(mainList[index]['activity_category'],
                          style: TextStyle(color: Colors.black)),
                      onTap: () {
                        print('Item tapped: ${mainList[index]}');
                      },
                    ),
                  );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
