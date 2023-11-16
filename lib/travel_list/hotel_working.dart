import 'dart:convert';
import 'package:excurra/services/MainAPI.dart';
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
  late Map<String, String> accumulatedData;
  var jsonData;
  Future<void> loadJsonAsset() async {
    var apiData = await MainAPI().getHotels('Hyderabad', accumulatedData['from_date']!, accumulatedData['to_date']!, accumulatedData['numberOfAdults']!, accumulatedData['numberofChildren']!);
    setState(() {
      jsonData = apiData;
    });
    //print(jsonData);
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    accumulatedData = widget.accumulatedData;
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
