import 'package:flutter/material.dart';
import 'package:excurra/constants.dart';

class CreateButton extends StatelessWidget {

  late Color bgColor;
  late String buttonName;
  late Function()? onPressed;

  CreateButton({required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: 290,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient:  LinearGradient (
            begin:  Alignment(-1.224, -1),
            end:  Alignment(1, 0.667),
            colors:  <Color>[Color(0xfffb4a4a), Color(0xff2026cc)],
            stops:  <double>[0, 1],
          ),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent),
          child: Text(
            buttonName,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}

