import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:excurra/Widgets/create_button.dart';
import 'package:excurra/screens/accommodation_screen.dart';
import 'package:excurra/Cards/flight_card.dart';
import 'package:excurra/services/MainAPI.dart';

class FlightWorking extends StatefulWidget {
  @override
  State<FlightWorking> createState() => _FlightWorkingState();
  late Map<String, String> accumulatedData;
  FlightWorking({required this.accumulatedData});
}

class _FlightWorkingState extends State<FlightWorking> with  AutomaticKeepAliveClientMixin<FlightWorking>{
  @override
  late Map<String, String> accumulatedData;
  var jsonData;
  Future<void> loadJsonAsset() async {
    var apiData = await MainAPI().getFlight(accumulatedData['dept_city']!, accumulatedData['arrival_city']!, accumulatedData['from_date']!, accumulatedData['to_date']!, accumulatedData['numberOfAdults']!, accumulatedData['numberofChildren']!, 'Economy');
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
    bool isThere1 = jsonData[0]['flightDetails'][0]['nonStop']=='true';
    bool isThere2 = jsonData[1]['flightDetails'][0]['nonStop']=='true';
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Expanded(
                 child: ListView.builder(
                     itemCount: jsonData.length,
                     itemBuilder: (context, index){
                       var flightData = jsonData[index];
                       return  FlightCard(
                         cost: flightData['totalAmount'].toString(),
                         toDest1: accumulatedData['arrival_city']!,
                         toTime1: flightData['flightDetails'][0]['arrivalTime'].toString().substring(11,16),
                         fromDest1: accumulatedData['dept_city']!,
                         fromTime1:  flightData['flightDetails'][0]['deptTime'].toString().substring(11,16),
                         flightName1: flightData['flightDetails'][0]['airlineNames'][0],
                         journeyTime1: flightData['flightDetails'][0]['duration'],
                         nonStop1: isThere1,
                         flightName2: flightData['flightDetails'][1]['airlineNames'][0],
                         fromDest2: accumulatedData['arrival_city']!,
                         fromTime2: flightData['flightDetails'][1]['deptTime'].toString().substring(11,16),
                         journeyTime2: flightData['flightDetails'][1]['duration'],
                         nonStop2: isThere2,
                         toDest2: accumulatedData['dept_city']!,
                         toTime2: flightData['flightDetails'][1]['arrivalTime'].toString().substring(11,16),
                         stopOver1: isThere1 ? ' ': flightData['flightDetails'][0]['stopoverAirports'][0],
                         stopOver2: isThere2 ? ' ': flightData['flightDetails'][1]['stopoverAirports'][0],
                       );
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
