import 'package:flutter/material.dart';
import 'package:excurra/constants.dart';

class ResortCard extends StatefulWidget {
  late String resortName;
  late String resortLocation;
  late List<dynamic> perks;
  late List<dynamic> meals;
  late int rating;
  late int totalAmount;
  late int imageNumber;
  final bool selected;
  final Function(bool) onSelect;
  ResortCard({
    required this.resortName,
    required this.resortLocation,
    required this.perks,
    required this.meals,
    required this.rating,
    required this.totalAmount,
    required this.imageNumber,
    required this.selected,
    required this.onSelect,
  });

  @override
  State<ResortCard> createState() => _ResortCardState();
}

class _ResortCardState extends State<ResortCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.selected ? Colors.lightBlueAccent : Colors.white,
      child: InkWell(
        onTap: () {
          setState(() {
            widget.onSelect(!widget.selected);
          });
        },
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('images/Resorts/img${widget.imageNumber}.jpeg'),
              SizedBox(height: 10.0,),
              Text(widget.resortName, style: kHeading1,),
              Text(widget.resortLocation, style: kHeading2,),
              SizedBox(height: 10.0,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var perk in widget.perks) ...[
                      Text('${perk}', style: TextStyle(color: Colors.black)),
                      if (widget.perks.last != perk) Text(', ', style: TextStyle(color: Colors.black)),
                    ],
                  ],
                ),
              ),
              SizedBox(height: 5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var meal in widget.meals) ...[
                      Text('${meal}', style: TextStyle(color: Colors.purple)),
                      if (widget.meals.last != meal) Text(', ', style: TextStyle(color: Colors.purple)),
                    ],
                    Text(' included', style: TextStyle(color: Colors.purple),)
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total: ₹${widget.totalAmount}', style: kHeading1),
                  Row(
                    children: List.generate( widget.rating,
                          (index) => Icon(Icons.star, color: Color(0xFFFFD700)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
