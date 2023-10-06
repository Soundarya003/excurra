import 'package:flutter/material.dart';

class CreateProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return  Container(
        child: Icon(Icons.face),
        margin: EdgeInsets.all(20.0),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.pinkAccent,
        ),
      );
  }

}