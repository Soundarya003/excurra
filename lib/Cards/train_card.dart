import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:excurra/constants.dart';

class TrainCard extends StatelessWidget {
  late String deptTime1;
  late String fromDest1;
  late String fromDest2;
  late String toDest1;
  late String toDest2;
  late String arrivalTime1;
  late int trainCode1;
  late String trainName1;
  late String journeyTime1;
  late String deptTime2;
  late String arrivalTime2;
  late int trainCode2;
  late String trainName2;
  late String journeyTime2;
  late int cost;

  TrainCard({
    required this.deptTime1,
    required this.arrivalTime1,
    required this.trainCode1,
    required this.journeyTime1,
    required this.deptTime2,
    required this.journeyTime2,
    required this.arrivalTime2,
    required this.trainCode2,
    required this.trainName1,
    required this.trainName2,
    required this.cost,
    required this.fromDest1,
    required this.toDest1,
    required this.fromDest2,
    required this.toDest2
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
                            Icons.train,
                            color: Colors.blue,
                          )),
                      Text(
                        '${trainName1} - ${trainCode1}',
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
                          journeyTime1,
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
                            Icons.train,
                            color: Colors.black,
                          )),
                      Text(
                        '${trainName2} - ${trainCode2}',
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
                          journeyTime2,
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
    );
  }
}
