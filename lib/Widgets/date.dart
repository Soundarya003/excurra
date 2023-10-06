import 'package:flutter/material.dart';
import 'package:excurra/constants.dart';
// ignore_for_file: prefer_const_constructors

class CreateDate extends StatelessWidget{
  late String currentDate ;
  late String destinationName;
  late Function()? onPressed;

  CreateDate({required this.destinationName,required this.onPressed, required this.currentDate});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shadowColor: Colors.transparent),
            onPressed: onPressed,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(destinationName, style: kDateText),
                SizedBox(height: 10.0,),
                Text(currentDate, style:kDateTextStyle,)
              ],
            )
        )
      ],
    );
  }

}