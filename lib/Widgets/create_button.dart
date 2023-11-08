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
          gradient:  purpleGradient,
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

