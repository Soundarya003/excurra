import 'package:excurra/constants.dart';
import 'package:excurra/screens/travelHistory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:excurra/screens/wishlist_screen.dart';
import 'package:provider/provider.dart';
import 'package:excurra/screens/welcome.dart';
import '../Authentication/google_sign_in.dart';
import '../Widgets/create_button.dart';
import '../services/MainAPI.dart';
import 'package:excurra/screens/firebase_helper.dart';

class ItineraryScreen extends StatefulWidget {
  static const String id = 'itinerary_screen';

  @override
  State<ItineraryScreen> createState() => _ItineraryScreenState();
}

class _ItineraryScreenState extends State<ItineraryScreen> {
  late List<Map<String,dynamic>> mappedList;
  late Map<String,dynamic> modeOfTransport = new Map<String,dynamic>();
  late Map<String,dynamic> modeOfAccommodation = new Map<String,dynamic>();
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

      // modeOfTransport = List<Map<String,dynamic>>.from(accumulatedData['travelData']);
      // modeOfAccommodation = List<Map<String,dynamic>>.from(accumulatedData['stayData']);


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

    var activities = jsonData['activities'];

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
                CreateButton(buttonName: 'Save to Wishlist', onPressed: (){
                  // print(accumulatedData);
                  mappedList= List<Map<String,dynamic>>.from(mainList);
                  String activitiesString = activities.toString();

                  saveWishlist(mappedList);
                  print('Hello');


                  //Navigator.pushNamed(context, WishlistScreen.id, arguments: mainList);
                }),
                CreateButton(buttonName: 'Book', onPressed: (){
                  modeOfTransport = accumulatedData['travelData'];
                  modeOfAccommodation = accumulatedData['stayData'];
                  print(accumulatedData['stayData']);
                  String activitiesString = activities.toString();
                  mappedList= List<Map<String,dynamic>>.from(mainList);
                  print("activities string $activitiesString");
                  saveTravelHistory(mappedList);
                  //Navigator.pushNamed(context, TravelHistory.id, arguments: mainList);
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

  void saveWishlist(List<Map<String,dynamic>> mappedList) async{
    final provider = Provider.of<GoogleSignInProvider>(
        context, listen: false);
    String? userId = provider.getUserIdIfSignedIn();

    if (userId != null) {
      print(userId);

      List<String> interestList = accumulatedData['interestList'].cast<
          String>();
      print(accumulatedData);

      if (!interestList.contains('tourism')) {
        interestList.add('tourism');
      }


      String interestsList = accumulatedData['interestList']
          .toString(); // Example: [adventure, shopping]
      String place = accumulatedData['arrival_city'].toString();
      print("The place is $place");
      print(interestList);

      await FirebaseFirestoreHelper.instance.addActivitiesForUser(
          userId, mappedList, interestsList, place);
    }

  }
  void saveTravelHistory(List<Map<String,dynamic>> mappedList) async {
    final provider = Provider.of<GoogleSignInProvider>(
        context, listen: false);
    String? userId = provider.getUserIdIfSignedIn();

    if (userId != null) {
      print(userId);

      List<String> interestList = accumulatedData['interestList'].cast<
          String>();

      if (!interestList.contains('tourism')) {
        interestList.add('tourism');
      }

      String place = accumulatedData['arrival_city'].toString();

      String fromDate = accumulatedData['from_date'];
      String toDate = accumulatedData['to_date'];
      String deptCity = accumulatedData['dept_city'].toString();
      String arrivalCity = accumulatedData['arrival_city'].toString();
      List<String> interestLists = accumulatedData['interestList'].cast<
          String>();

      if (!interestList.contains('tourism')) {
        interestList.add('tourism');
      }
      String interestsLists = accumulatedData['interestList']
          .toString();
      String travelType = accumulatedData['travelType'];
      String stayType = accumulatedData['stayType'];


      await FirebaseFirestoreHelper.instance.addTravelHistoryForUser(
          userId,
          fromDate,
          toDate,
          deptCity,
          arrivalCity,
          travelType,
          stayType,
          interestsLists,
          modeOfAccommodation,
          modeOfTransport,
          mappedList);


      print('Travel history saved successfully!');
    } else {
      print('User not signed in.');
    }
  }
}