import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
import 'package:excurra/Widgets/create_button.dart';
import 'package:excurra/constants.dart';
import 'package:excurra/screens/itenary_screen.dart';

class ChoiceScreen extends StatefulWidget {
  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
  static const String id = 'preference_screen';


}

class _ChoiceScreenState extends State<ChoiceScreen> with TickerProviderStateMixin{

  List<String> interestList = []; // List to store entered
  List<String> mustList = [];
  List travelPreference = ['Solo', 'Couple','Friends','Family'];
  List budgetPreference = ['Normal','Economy','Luxury'];
  List foodPreference = ['Vegetarian', 'Non-Vegetarian'];
  TextEditingController interestController = TextEditingController();
  TextEditingController mustController = TextEditingController();
  late TabController travel_controller;
  late TabController budget_controller;
  late TabController foodType_controller;
  int x=0, y=0, z=0;
  void initState() {
    // TODO: implement initState
    super.initState();
    travel_controller = TabController(length: 4, vsync: this);
    budget_controller = TabController(length: 3, vsync: this);
    foodType_controller = TabController(length: 2, vsync: this);

    travel_controller.addListener(() {
      setState(() {
        x = travel_controller.index;
      });
      print("Selected Index: " + travel_controller.index.toString());
    });
    budget_controller.addListener(() {
      setState(() {
        y = budget_controller.index;
      });
      print("Selected Index: " + budget_controller.index.toString());
    });

    foodType_controller.addListener(() {
      setState(() {
        z = foodType_controller.index;
      });
      print("Selected Index: " + foodType_controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {

    Map<String, String> accumulatedData = ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    Map<String, dynamic> finalData = new Map();
    if(accumulatedData!=null){
      finalData.addAll(accumulatedData);
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
            children: [
              Container(
          ),
          SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
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
                            )),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Text('Choose Your Travel Preference', style: kPreferenceTextStyle,),
                    SizedBox(height: 20.0,),
                    DefaultTabController(
                      length: 4,
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Color(0xbfff5f5f7),
                            borderRadius: BorderRadius.circular(25.0)),
                        child: TabBar(
                          controller: travel_controller,
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
                    SizedBox(height: 20.0,),
                    Text('Your Budget', style: kPreferenceTextStyle,),
                    SizedBox(height: 20.0,),
                    DefaultTabController(
                      length: 3,
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Color(0xbfff5f5f7),
                            borderRadius: BorderRadius.circular(25.0)),
                        child: TabBar(
                          controller: budget_controller,
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
                    SizedBox(height: 20.0,),
                    Text('Food type', style: kPreferenceTextStyle,),
                    SizedBox(height: 20.0,),
                    DefaultTabController(
                      length: 2,
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Color(0xbfff5f5f7),
                            borderRadius: BorderRadius.circular(25.0)),
                        child: TabBar(
                          controller: foodType_controller,
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
                    SizedBox(height: 20.0,),
                    Text('Interests', style: kPreferenceTextStyle,),
                    SizedBox(height: 20.0,),
                 Center(
                   child: Column(
                     mainAxisSize: MainAxisSize.min,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: TextField(
                           controller: interestController,
                           onSubmitted: (text) {
                             setState(() {
                               interestList.add(text);
                               interestController.clear();
                             });
                           },
                           style: TextStyle(
                             color: Colors.black,
                           ),
                           decoration: InputDecoration(
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(12.0), // Adjust border radius
                               borderSide: BorderSide(
                                 color: Colors.black, // Set border color
                                 width: 2.0, // Set border width
                               ),
                             ),
                             enabledBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(12.0), // Adjust border radius
                               borderSide: BorderSide(
                                 color: Colors.black, // Set border color
                                 width: 2.0, // Set border width
                               ),
                             ),
                             focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(12.0), // Adjust border radius
                               borderSide: BorderSide(
                                 color: Colors.purple, // Set border color
                                 width: 2.0, // Set border width
                               ),
                             ),
                             hintText: 'Enter Text',
                             hintStyle: TextStyle(
                               color: Colors.black,
                             ),
                             suffixIcon: IconButton(
                               icon: Icon(Icons.add),
                               onPressed: () {
                                 setState(() {
                                   final text = interestController.text;
                                   if (text.isNotEmpty) {
                                     interestList.add(text);
                                     interestController.clear();
                                   }
                                 });
                               },
                             ),
                           ),
                         ),
                       ),
                       const SizedBox(height: 10),
                       Container(
                         width: 330.0,
                         height: 70,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20.0),
                           border: Border.all(width: 2.0, color: Colors.grey),
                         ),
                         child: Padding(
                           padding: EdgeInsets.all(10.0),
                           child: SingleChildScrollView(
                             scrollDirection: Axis.horizontal, // Scroll horizontally
                             child: Wrap(
                               alignment: WrapAlignment.center,
                               spacing: 5.0,
                               children: interestList.map((String text) {
                                 return InputChip(
                                   label: Text(text),
                                   onDeleted: () {
                                     setState(() {
                                       interestList.remove(text);
                                     });
                                   },
                                 );
                               }).toList(),
                             ),
                           ),
                         ),
                       )

                     ],
                   ),
                 ),
                    SizedBox(height:20 ,),
                    Text('Must visit places', style: kPreferenceTextStyle,),
                    SizedBox(height: 20.0,),
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: mustController,
                              onSubmitted: (text) {
                                setState(() {
                                  mustList.add(text);
                                  mustController.clear();
                                });
                              },
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0), // Adjust border radius
                                  borderSide: BorderSide(
                                    color: Colors.black, // Set border color
                                    width: 2.0, // Set border width
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0), // Adjust border radius
                                  borderSide: BorderSide(
                                    color: Colors.black, // Set border color
                                    width: 2.0, // Set border width
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0), // Adjust border radius
                                  borderSide: BorderSide(
                                    color: Colors.purple, // Set border color
                                    width: 2.0, // Set border width
                                  ),
                                ),
                                hintText: 'Enter Text',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      final text = mustController.text;
                                      if (text.isNotEmpty) {
                                        mustList.add(text);
                                        mustController.clear();
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: 330.0,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(width: 2.0, color: Colors.grey),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal, // Scroll horizontally
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 5.0,
                                  children: mustList.map((String text) {
                                    return InputChip(
                                      label: Text(text),
                                      onDeleted: () {
                                        setState(() {
                                          mustList.remove(text);
                                        });
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          )
                          ,
                        ],
                      ),
                    ),
                    SizedBox(height:40 ,),
                    Align(
                      child: CreateButton(buttonName: 'Next', onPressed: () {
                        finalData.addAll({
                          'travelPreference': travelPreference[x],
                          'budgetPreference': budgetPreference[y],
                          'foodPreference': foodPreference[z],
                          'interestList': interestList,
                          'mustList': mustList
                        });
                        Navigator.pushNamed(context, ItineraryScreen.id, arguments: finalData);
                      }),
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
            ]
        ),)
    );
  }
}
