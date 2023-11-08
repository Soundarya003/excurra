import 'package:flutter/material.dart';
import 'package:excurra/constants.dart';

class TravellerWidget extends StatelessWidget {
  late Function()? add;
  late Function()? subtract;
  late String numberOfPassangers;
  late String title;
  TravellerWidget({required this.add, required this.subtract, required this.numberOfPassangers, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Number of ${title} ',
          style: kTraveller,
        ),
        TextButton(
          onPressed: subtract,
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey
          ),
          child: Icon(
            Icons.remove,
            color: Colors.black,
          ),
        ),
        Text(
          numberOfPassangers,
          style: TextStyle(color: Colors.black),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey
          ),
            onPressed: add,
            child: Icon(
              Icons.add,
              color: Colors.black,
            )),
      ],
    );
  }
}
