import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excurra/Widgets/create_button.dart';
import 'package:excurra/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TravelHistory extends StatefulWidget {
  const TravelHistory({Key? key}) : super(key: key);
  static const String id = 'wishlist_screen';

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
  late  List<String> resultList;
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

  late List<String> places = [];
  late List<String> interests = [];
  late List<Map<String, dynamic>> dummyList = [];
  late List<dynamic> mustList = [];

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
        places.add(doc.get('place'));
        mustList.add(doc.get('itinerary'));
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
    print(interests);
    print(places);
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
                        itemCount: places.length,
                        itemBuilder: (context, index){
                          String place = places[index];
                          String interest = interests[index];
                          return ListTile(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DataScreen(mainList: mustList[index]),
                                ),
                              );
                            },
                            title:  Text('${place} \n${interest}', style: TextStyle(color: Colors.black),),
                          );
                        }
                    )
                ),
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
  DataScreen({required this.mainList});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: mainList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              child: ListTile(
                title: Text(mainList[index]['activity_place'],
                    style: TextStyle(color: Colors.black)),
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
      ),
    );
  }
}
