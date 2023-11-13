import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:excurra/Cards/hotel_card.dart';
import 'package:excurra/Widgets/create_button.dart';
import 'package:excurra/screens/preference.dart';

class HotelWorking extends StatefulWidget {
  late Map<String, String> accumulatedData;
  HotelWorking({required this.accumulatedData});
  @override
  State<HotelWorking> createState() => _HotelWorkingState();
}

class _HotelWorkingState extends State<HotelWorking> {
  @override
  var jsonData;
  Future<void> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('json/hotel_data.json');
    var data = jsonDecode(jsonString);
    setState(() {
      jsonData = data;
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonAsset();
  }
  Widget build(BuildContext context) {
    final accumulatedData = widget.accumulatedData;
    if (jsonData == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: jsonData.length,
                  itemBuilder: (context, index){
                    var hotelData = jsonData[index];
                    return HotelCard(
                        hotelName: hotelData['hotelName'],
                        hotelLocation: hotelData['hotelLocation'],
                        perks: hotelData['perks'],
                        meals: hotelData['meals'],
                        rating: hotelData['rating'],
                        totalAmount: hotelData['totalAmount'],
                        imageNumber: index+1
                    );
                  }
              )
          ),
          Align(
            child: CreateButton(
                buttonName: 'Next',
                onPressed: () {
                  Navigator.pushNamed(context, ChoiceScreen.id,
                      arguments:  accumulatedData);
                }),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
