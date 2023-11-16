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
  late Map<String, String> accumulatedData;
  TrainWorking({required this.accumulatedData});
}

class _TrainWorkingState extends State<TrainWorking> with AutomaticKeepAliveClientMixin<TrainWorking>{
  @override
  var jsonData;
  var newData;
  late Map<String, String> accumulatedData;
  Future<void> loadJsonAsset() async {
    var apiData = await MainAPI().getTrain('Chennai', 'Hyderabad', accumulatedData['from_date']!, accumulatedData['to_date']!, accumulatedData['numberOfAdults']!, accumulatedData['numberofChildren']!, 'Sleeper');
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
                        fromDest1: 'Vijawayada',
                        toDest1: 'Chennai',
                        fromDest2: 'Chennai',
                        toDest2: 'Vijaywada',);
                  }
              ),
            ),
            Align(
              child: CreateButton(
                  buttonName: 'Next',
                  onPressed: () {
                    Navigator.pushNamed(context, AccomodationScreen.id,
                        arguments:  accumulatedData);
                    // Navigator.pushNamed(context, AccomodationScreen.id,
                    //     arguments:  accumulatedData);
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
