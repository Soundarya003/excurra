import 'dart:convert';
import 'package:excurra/Widgets/create_button.dart';
import 'package:excurra/screens/accommodation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:excurra/Cards/train_card.dart';
import 'package:excurra/services/MainAPI.dart';

class TrainWorking extends StatefulWidget {
  @override
  State<TrainWorking> createState() => _TrainWorkingState();
  late Map<String, dynamic> accumulatedData;
  TrainWorking({required this.accumulatedData});
}

class _TrainWorkingState extends State<TrainWorking> with AutomaticKeepAliveClientMixin<TrainWorking>{
  @override
  var jsonData;
  var newData;
  int selectedCardIndex = -1;
  late Map<String, dynamic> accumulatedData;
  Future<void> loadJsonAsset() async {
    var apiData = await MainAPI().getTrain(accumulatedData['dept_city']!, accumulatedData['arrival_city']!, accumulatedData['from_date']!, accumulatedData['to_date']!, accumulatedData['numberOfAdults']!, accumulatedData['numberofChildren']!, 'Sleeper');
    setState(() {
      newData = apiData;
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
    if (newData == null) {
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
                  itemCount: 4,
                  itemBuilder: (context, index){
                    var trainData = newData[index]['train_details'];
                    return  TrainCard(
                        deptTime1: trainData[0]['deptTime'],
                        arrivalTime1: trainData[0]['arrivalTime'],
                        trainCode1: trainData[0]['trainCode'],
                        journeyTime1: trainData[0]['duration'],
                        deptTime2: trainData[1]['deptTime'],
                        journeyTime2: trainData[1]['duration'],
                        arrivalTime2: trainData[1]['arrivalTime'],
                        trainCode2: trainData[1]['trainCode'],
                        trainName1: trainData[0]['trainName'],
                        trainName2: trainData[1]['trainName'],
                        cost: newData[index]['total_amount'],
                        fromDest1: accumulatedData['dept_city']!,
                        toDest1: accumulatedData['arrival_city']!,
                        fromDest2: accumulatedData['arrival_city']!,
                        toDest2:  accumulatedData['dept_city']!,
                        selected: selectedCardIndex == index,
                        onSelect: (bool ) { handleCardSelection(index); },);
                  }
              ),
            ),
            Align(
              child: CreateButton(
                  buttonName: 'Next',
                  onPressed: () {
                    if (selectedCardIndex != -1) {
                      print("Selected card index: $selectedCardIndex");
                      print(newData[selectedCardIndex]);
                      accumulatedData.addAll({
                        'trainData': newData[selectedCardIndex]
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
