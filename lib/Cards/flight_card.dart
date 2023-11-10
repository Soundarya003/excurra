import 'package:flutter/material.dart';
import 'package:excurra/constants.dart';


class FlightCard extends StatelessWidget {
  late String fromDest1;
  late String toDest1;
  late String journeyTime1;
  late String fromTime1;
  late String toTime1;
  late String cost;
  late String flightName1;
  late bool nonStop1;
  late String fromDest2;
  late String toDest2;
  late String journeyTime2;
  late String fromTime2;
  late String toTime2;
  late String flightName2;
  late bool nonStop2;
  late String stopOver1;
  late String stopOver2;
  FlightCard({
        required this.cost,
        required this.toDest1,
        required this.toTime1,
        required this.fromDest1,
        required this.fromTime1,
        required this.flightName1,
        required this.journeyTime1,
        required this.nonStop1,
        required this.flightName2,
        required this.fromDest2,
        required this.fromTime2,
        required this.journeyTime2,
        required this.nonStop2,
        required this.toDest2,
        required this.toTime2,
        required this.stopOver1,
        required this.stopOver2
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
                            Icons.flight,
                            color: Colors.blue,
                          )),
                      Text(
                        flightName1,
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
                          fromTime1,
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
                        nonStop1 ? Padding(
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
                        ) : Padding(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 45,
                                height: 2,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      gradient: purpleGradient),
                                ),
                              ),
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.yellow,
                                ),
                              ),
                              SizedBox(
                                width: 45,
                                height: 2,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      gradient: purpleGradient),
                                ),
                              ),
                            ],
                          ),
                        ),
                        nonStop1? Text(
                          'Non-Stop',
                          style: kSmallHeading,
                        ):
                        Text(
                          'Layover at \n${stopOver1}',
                          textAlign: TextAlign.center,
                          style: kSmallHeading,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          toTime1,
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
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: Icon(
                              Icons.flight,
                              color: Colors.blue,
                            ),
                          )),
                      Text(
                        flightName2,
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
                          fromTime2,
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
                        nonStop2 ? Padding(
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
                        ) : Padding(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 45,
                                height: 2,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      gradient: purpleGradient),
                                ),
                              ),
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.yellow,
                                ),
                              ),
                              SizedBox(
                                width: 45,
                                height: 2,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      gradient: purpleGradient),
                                ),
                              ),
                            ],
                          ),
                        ),
                        nonStop2? Text(
                          'Non-Stop',
                          style: kSmallHeading,
                        ):
                        Text(
                          'Layover at \n${stopOver2}',
                          textAlign: TextAlign.center,
                          style: kSmallHeading,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          toTime2,
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
