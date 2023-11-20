import 'package:flutter/material.dart';
import 'package:excurra/constants.dart';
class FlightCard extends StatefulWidget {
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
  final bool selected;
  final Function(bool) onSelect;
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
        required this.stopOver2,
        required this.selected,
        required this.onSelect,
      });

  @override
  State<FlightCard> createState() => _FlightCardState();
}

class _FlightCardState extends State<FlightCard> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shadowColor: Colors.grey,
      color: widget.selected ? Colors.lightBlueAccent : Colors.white,
      margin: EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          setState(() {
            widget.onSelect(!widget.selected);
          });
        },
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
                          widget.flightName1,
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
                            widget.fromTime1,
                            style: kHeading1,
                          ),
                          Text(
                            widget.fromDest1,
                            style: kHeading2,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            widget.journeyTime1,
                            style: TextStyle(fontSize: 12,),
                          ),
                          widget.nonStop1 ? Padding(
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
                          widget.nonStop1? Text(
                            'Non-Stop',
                            style: kSmallHeading,
                          ):
                          Text(
                            'Layover at \n${widget.stopOver1}',
                            textAlign: TextAlign.center,
                            style: kSmallHeading,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            widget.toTime1,
                            style: kHeading1,
                          ),
                          Text(
                            widget.toDest1,
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
                          widget.flightName2,
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
                            widget.fromTime2,
                            style: kHeading1,
                          ),
                          Text(
                            widget.fromDest2,
                            style: kHeading2,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            widget.journeyTime2,
                            style: TextStyle(fontSize: 12,),
                          ),
                          widget.nonStop2 ? Padding(
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
                          widget.nonStop2? Text(
                            'Non-Stop',
                            style: kSmallHeading,
                          ):
                          Text(
                            'Layover at \n${widget.stopOver2}',
                            textAlign: TextAlign.center,
                            style: kSmallHeading,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            widget.toTime2,
                            style: kHeading1,
                          ),
                          Text(
                            widget.toDest2,
                            style: kHeading2,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 30.0,),
              Text('Total: ₹${widget.cost}', style: kHeading1,)
            ],
          ),
        ),
      ),
    );
  }
}
