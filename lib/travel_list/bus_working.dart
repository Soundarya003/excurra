import 'dart:convert';

import 'package:excurra/Widgets/create_button.dart';
import 'package:excurra/screens/accommodation_screen.dart';
import 'package:flutter/material.dart';
import 'package:excurra/Cards/bus_card.dart';
import 'package:flutter/services.dart';

class BusWorking extends StatefulWidget {

  @override
  State<BusWorking> createState() => _BusWorkingState();
  late Map<String, String> accumulatedData;
  BusWorking({required this.accumulatedData});
}

class _BusWorkingState extends State<BusWorking> with AutomaticKeepAliveClientMixin<BusWorking>{
  @override
  var jsonData;
  Future<void> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('json/bus_data.json');
    var data = jsonDecode(jsonString);
    setState(() {
      jsonData = data;
    });
    //print(jsonData);
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
                    var busData = jsonData[index]['bus_details'];
                    return  BusCard(
                        fromDest1: 'Chennai',
                        toDest1: 'Delhi',
                        arrivalTime1: busData[0]['arrivalTime'],
                        deptTime1: busData[0]['deptTime'],
                        busCode1: busData[0]['busCode'],
                        busName1: busData[0]['busName'],
                        duration1: busData[0]['duration'],
                        fromDest2: 'Delhi',
                        toDest2: 'Chennai',
                        arrivalTime2: busData[1]['arrivalTime'],
                        deptTime2: busData[1]['deptTime'],
                        busCode2: busData[1]['busCode'],
                        busName2: busData[1]['busName'],
                        duration2: busData[1]['duration'],
                        cost: jsonData[index]['total_amount']);
                  }
              ),
            ),
            Align(
              child: CreateButton(
                  buttonName: 'Next',
                  onPressed: () {
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
