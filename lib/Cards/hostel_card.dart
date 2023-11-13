import 'package:flutter/material.dart';
import 'package:excurra/constants.dart';

class HostelCard extends StatelessWidget {
  @override
  late String hostelName;
  late String hostelLocation;
  late List<dynamic> meals;
  late int rating;
  late int totalAmount;
  late int imageNumber;
  HostelCard({
      required this.hostelName,
      required this.hostelLocation,
      required this.meals,
      required this.rating,
      required this.totalAmount,
      required this.imageNumber
  });
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('images/Hostels/img${imageNumber}.jpg'),
            SizedBox(height: 10.0,),
            Text(hostelName, style: kHeading1,),
            Text(hostelLocation, style: kHeading2,),
            SizedBox(height: 10.0,),
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