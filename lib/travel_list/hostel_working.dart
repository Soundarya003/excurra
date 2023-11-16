import 'dart:convert';
import 'package:excurra/Cards/hostel_card.dart';
import 'package:excurra/Widgets/create_button.dart';
import 'package:excurra/services/MainAPI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:excurra/screens/preference.dart';

class HostelWorking extends StatefulWidget {
  late Map<String, String> accumulatedData;
  HostelWorking({required this.accumulatedData});

  @override
  State<HostelWorking> createState() => _HostelWorkingState();
}

class _HostelWorkingState extends State<HostelWorking> {
  late Map<String, String> accumulatedData;
  var jsonData;
  Future<void> loadJsonAsset() async {
    var apiData = await MainAPI().getHostels('Hyderabad', accumulatedData['from_date']!, accumulatedData['to_date']!, accumulatedData['numberOfAdults']!, accumulatedData['numberofChildren']!);
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
