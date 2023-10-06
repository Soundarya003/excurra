import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
import 'package:excurra/Widgets/create_button.dart';
import 'package:excurra/constants.dart';
import 'package:excurra/screens/preference.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({Key? key}) : super(key: key);
  static const String id = 'hotel_screen';

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
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
                    TextButton(onPressed: () {Navigator.pop(context);}, child: Icon(Icons.arrow_back, color:  Colors.black,size: 30.0,)),
                    TextButton(onPressed: (){}, child: Icon(Icons.menu,color: Colors.black,size: 30.0,))
                  ],
                ),
                SizedBox(height: 15.0,),
                DefaultTabController(
                  length: 3,
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Color(0xbfff5f5f7),
                        borderRadius: BorderRadius.circular(25.0)
                    ),
                    child: TabBar(
                      unselectedLabelColor: Colors.black,
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
                            child: Text("Hotels"),
                          ),
                        ),
                        Tab(child: Align(
                          alignment: Alignment.center,
                          child: Text('AirBnb'),
                        ),),
                        Tab(child: Align(
                          alignment: Alignment.center,
                          child: Text('Resorts',),
                        ),),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 550.0,),
                Align(child: CreateButton(buttonName: 'Next', onPressed: (){
                  Navigator.pushNamed(context, ChoiceScreen.id);
                }), alignment: Alignment.center,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
