import 'dart:convert';
import 'package:excurra/Cards/hostel_card.dart';
import 'package:excurra/Widgets/create_button.dart';
import 'package:excurra/services/MainAPI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:excurra/screens/preference.dart';

class HostelWorking extends StatefulWidget {
  late Map<String, dynamic> accumulatedData;
  HostelWorking({required this.accumulatedData});

  @override
  State<HostelWorking> createState() => _HostelWorkingState();
}

class _HostelWorkingState extends State<HostelWorking> {
  late Map<String, dynamic> accumulatedData;
  var jsonData;
  int selectedCardIndex = -1;
  Future<void> loadJsonAsset() async {
    var apiData = await MainAPI().getHostels(accumulatedData['arrival_city']!, accumulatedData['from_date']!, accumulatedData['to_date']!, accumulatedData['numberOfAdults']!, accumulatedData['numberofChildren']!);
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
                    var hostelData = jsonData[index];
                    return HostelCard(
                        hostelName: hostelData['hostelName'],
                        hostelLocation: hostelData['hostelLocation'],
                        meals: hostelData['meals'],
                        rating: hostelData['rating'],
                        totalAmount: hostelData['totalAmount'],
                        imageNumber: index+1,
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
                      'hostelData': jsonData[selectedCardIndex]
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
