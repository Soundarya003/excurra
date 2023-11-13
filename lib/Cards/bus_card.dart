import 'package:flutter/material.dart';
import 'package:excurra/constants.dart';

class BusCard extends StatelessWidget {
  late String fromDest1;
  late String toDest1;
  late String deptTime1;
  late String arrivalTime1;
  late int busCode1;
  late String busName1;
  late int cost;
  late String duration1;
  late String fromDest2;
  late String toDest2;
  late String deptTime2;
  late String arrivalTime2;
  late int busCode2;
  late String busName2;
  late String duration2;

  BusCard({
     required this.fromDest1,
    required this.toDest1,
    required this.arrivalTime1,
    required this.deptTime1,
    required this.busCode1,
    required this.busName1,
    required this.duration1,
    required this.fromDest2,
    required this.toDest2,
    required this.arrivalTime2,
    required this.deptTime2,
    required this.busCode2,
    required this.busName2,
    required this.duration2,
    required this.cost
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shadowColor: Colors.grey,
      color: Colors.white,
      margin: EdgeInsets.all(5.0),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(right: 7.0),
                          child: Icon(
                            Icons.directions_bus,
                            color: Colors.blue,
                          )),
                      Text(
                        '${busName1} - ${busCode1}',
                        style: kHeading1,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          deptTime1,
                          style: kHeading1,
                        ),
                        Text(
                          fromDest1,
                          style: kHeading2,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          duration1,
                          style: TextStyle(fontSize: 12,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(
                              top: 5.0, bottom: 5.0),
                          child: SizedBox(
                            width: 100,
                            height: 2,
                            child: Container(
                              decoration: const BoxDecoration(
                                  gradient: purpleGradient),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          arrivalTime1,
                          style: kHeading1,
                        ),
                        Text(
                          toDest1,
                          style: kHeading2,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 40.0,
              child: Divider(thickness: 0.5,color: Colors.grey,),),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: 7.0),
                          child: Icon(
                            Icons.directions_bus,
                            color: Colors.black,
                          )),
                      Text(
                        '${busName2} - ${busCode2}',
                        style: kHeading1,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          deptTime2,
                          style: kHeading1,
                        ),
                        Text(
                          fromDest2,
                          style: kHeading2,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          duration2,
                          style: TextStyle(fontSize: 12,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(
                              top: 5.0, bottom: 5.0),
                          child: SizedBox(
                            width: 100,
                            height: 2,
                            child: Container(
                              decoration: const BoxDecoration(
                                  gradient: purpleGradient),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          arrivalTime2,
                          style: kHeading1,
                        ),
                        Text(
                          toDest2,
                          style: kHeading2,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 30.0,),
            Text('Total: ₹${cost}', style: kHeading1,)
          ],
        ),
      ),
    );;
  }
}
