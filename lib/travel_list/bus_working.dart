import 'dart:convert';
import 'package:excurra/Widgets/create_button.dart';
import 'package:excurra/screens/accommodation_screen.dart';
import 'package:excurra/services/MainAPI.dart';
import 'package:flutter/material.dart';
import 'package:excurra/Cards/bus_card.dart';
import 'package:flutter/services.dart';

class BusWorking extends StatefulWidget {
  @override
  State<BusWorking> createState() => _BusWorkingState();
  late Map<String, dynamic> accumulatedData;
  BusWorking({required this.accumulatedData});
}

class _BusWorkingState extends State<BusWorking> with AutomaticKeepAliveClientMixin<BusWorking>{
  @override
  late Map<String, dynamic> accumulatedData;
  var jsonData;
  int selectedCardIndex = -1;
  Future<void> loadJsonAsset() async {
    var apiData = await MainAPI().getBuses(accumulatedData['dept_city']!, accumulatedData['arrival_city']!, accumulatedData['from_date']!, accumulatedData['to_date']!, accumulatedData['numberOfAdults']!, accumulatedData['numberofChildren']!, 'Sleeper');
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
                    var busData = jsonData[index]['bus_details'];
                    return  BusCard(
                        fromDest1: accumulatedData['dept_city']!,
                        toDest1: accumulatedData['arrival_city']!,
                        arrivalTime1: busData[0]['arrivalTime'],
                        deptTime1: busData[0]['deptTime'],
                        busCode1: busData[0]['busCode'],
                        busName1: busData[0]['busName'],
                        duration1: busData[0]['duration'],
                        fromDest2:  accumulatedData['arrival_city']!,
                        toDest2: accumulatedData['dept_city']!,
                        arrivalTime2: busData[1]['arrivalTime'],
                        deptTime2: busData[1]['deptTime'],
                        busCode2: busData[1]['busCode'],
                        busName2: busData[1]['busName'],
                        duration2: busData[1]['duration'],
                        cost: jsonData[index]['total_amount'],
                        selected: selectedCardIndex == index,
                       onSelect: (bool ) {
                         handleCardSelection(index);
                       },
                    );
                  }
              ),
            ),
            Align(
              child: CreateButton(
                  buttonName: 'Next',
                  onPressed: () {
                    if (selectedCardIndex != -1) {
                      print("Selected card index: $selectedCardIndex");
                      print(jsonData[selectedCardIndex]);
                      accumulatedData.addAll({
                        'busData': jsonData[selectedCardIndex]
                      });
                    }
                    Navigator.pushNamed(context, AccomodationScreen.id,
                        arguments:  accumulatedData);
                  }),
              alignment: Alignment.center,
            ),],
        )
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
