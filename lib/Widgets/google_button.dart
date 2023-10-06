import 'package:flutter/material.dart';
import 'package:excurra/constants.dart';

class GoogleButton extends StatelessWidget {

  late Function()? onPressed;
  GoogleButton({required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed, 
        child: Image.asset('images/download.png')
    );
  }
}

