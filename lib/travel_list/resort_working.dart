import 'dart:convert';
import 'package:excurra/services/MainAPI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:excurra/Cards/resort_card.dart';
import 'package:excurra/screens/preference.dart';
import 'package:excurra/Widgets/create_button.dart';
import 'dart:math';

class ResortWorking extends StatefulWidget {
  late Map<String, dynamic> accumulatedData;
  ResortWorking({required this.accumulatedData});
  @override
  State<ResortWorking> createState() => _ResortWorkingState();
}

class _ResortWorkingState extends State<ResortWorking> {
  late Map<String, dynamic> accumulatedData;
  var jsonData;
  int selectedCardIndex = -1;
  Future<void> loadJsonAsset() async {
    var apiData = await MainAPI().getResorts( accumulatedData['arrival_city']!, accumulatedData['from_date']!, accumulatedData['to_date']!, accumulatedData['numberOfAdults']!, accumulatedData['numberofChildren']!);
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

  List<int> generateUniqueRandomNumbers(int maxNumber) {
    List<int> numbers = List.generate(maxNumber, (index) => index + 1);
    numbers.shuffle();
    return numbers;
  }

  @override
  Widget build(BuildContext context) {
    final accumulatedData = widget.accumulatedData;
    if (jsonData == null) {
      return Center(child: CircularProgressIndicator());
    }
    void handleCardSelection(int index) {
      setState(() {
        if (selectedCardIndex == index) {
          selectedCardIndex = -1; // Deselect the card if it's already selected
        } else {
          selectedCardIndex = index; // Select the new card
        }
      });
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
                    return ResortCard(
                      resortName: hotelData['resortName'],
                      resortLocation: hotelData['resortLocation'],
                      perks: hotelData['perks'],
                      meals: hotelData['meals'],
                      rating: hotelData['rating'],
                      totalAmount: hotelData['totalAmount'],
                      imageNumber:  index+1,
                      selected: selectedCardIndex == index,
                      onSelect: (bool selected) {
                        handleCardSelection(index);
                      },
                    );
                  }
              )
          ),
          Align(
            child: CreateButton(
                buttonName: 'Next',
                onPressed: () {
                  if (selectedCardIndex != -1) {
                    print("Selected card index: $selectedCardIndex");
                    print(jsonData[selectedCardIndex]);
                    accumulatedData.addAll({
                      'resortData': jsonData[selectedCardIndex]
                    });
                  }
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
