import 'package:flutter/material.dart';
import 'package:excurra/constants.dart';

class ResortCard extends StatelessWidget {
  late String resortName;
  late String resortLocation;
  late List<dynamic> perks;
  late List<dynamic> meals;
  late int rating;
  late int totalAmount;
  late int imageNumber;
  ResortCard({
    required this.resortName,
    required this.resortLocation,
    required this.perks,
    required this.meals,
    required this.rating,
    required this.totalAmount,
    required this.imageNumber
  });

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
            Image.asset('images/Resorts/img${imageNumber}.jpeg'),
            SizedBox(height: 10.0,),
            Text(resortName, style: kHeading1,),
            Text(resortLocation, style: kHeading2,),
            SizedBox(height: 10.0,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var perk in perks) ...[
                    Text('${perk}', style: TextStyle(color: Colors.black)),
                    if (perks.last != perk) Text(', ', style: TextStyle(color: Colors.black)),
                  ],
                ],
              ),
            ),
            SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var meal in meals) ...[
                    Text('${meal}', style: TextStyle(color: Colors.purple)),
                    if (meals.last != meal) Text(', ', style: TextStyle(color: Colors.purple)),
                  ],
                  Text(' included', style: TextStyle(color: Colors.purple),)
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total: ₹${totalAmount}', style: kHeading1),
                Row(
                  children: List.generate( rating,
                        (index) => Icon(Icons.star, color: Color(0xFFFFD700)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
