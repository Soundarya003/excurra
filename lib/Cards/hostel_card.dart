import 'package:flutter/material.dart';
import 'package:excurra/constants.dart';

class HostelCard extends StatefulWidget {
  @override
  late String hostelName;
  late String hostelLocation;
  late List<dynamic> meals;
  late int rating;
  late int totalAmount;
  late int imageNumber;
  final bool selected;
  final Function(bool) onSelect;
  HostelCard({
      required this.hostelName,
      required this.hostelLocation,
      required this.meals,
      required this.rating,
      required this.totalAmount,
      required this.imageNumber,
      required this.selected,
      required this.onSelect,
  });

  @override
  State<HostelCard> createState() => _HostelCardState();
}

class _HostelCardState extends State<HostelCard> {
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
              Image.asset('images/Hostels/img${widget.imageNumber}.jpg'),
              SizedBox(height: 10.0,),
              Text(widget.hostelName, style: kHeading1,),
              Text(widget.hostelLocation, style: kHeading2,),
              SizedBox(height: 10.0,),
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
                    children: List.generate(widget.rating,
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

