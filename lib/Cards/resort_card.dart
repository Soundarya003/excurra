import 'package:flutter/material.dart';
import 'dart:math';

class ResortCard extends StatelessWidget {
  List<String> perks = [
    "Free Wifi",
    "Swimming Pool",
    "Spa",
    "Beach",
    "Children Parks",
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('images/Resorts/img8.jpeg'),
            Icon(Icons.star, color: Colors.yellow,),
            Text('Sandals Resorts', style: TextStyle(color: Colors.black),),
            Text('Central City, Bhubaneswar', style: TextStyle(color: Colors.black),),
            Text('Free Wifi | Game Room', style: TextStyle(color: Colors.black),),
            Text('Breakfast included', style: TextStyle(color: Colors.lightGreen),),
            SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: perks.map((perk) => Text('${perk}, ', style: TextStyle(color: Colors.black))).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
