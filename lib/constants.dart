import 'package:flutter/material.dart';


const kButtonTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
  fontSize: 15.0,
  fontFamily: 'Poppins-light'
);

const kDateTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    fontFamily: 'Raleway-Light'
);
const kHeading = TextStyle(
    fontFamily: 'Poppins-Light',
    fontWeight: FontWeight.w700,
    fontSize: 20.0,
    color: Colors.black
);

const kDateText = TextStyle(
    color: Color(0xff63767e),
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    fontFamily: 'Raleway-Regular'
);

const kBookingTravelText = TextStyle(
    fontFamily: 'Poppins-Light',
    fontWeight: FontWeight.w700,
     fontSize: 18.0,
);

BoxDecoration mainBoxDecoration(){
  return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24.0)
  );
}

BoxDecoration countryFieldDecoration(){
  return BoxDecoration(
    borderRadius: BorderRadius.circular(50.0),
    border: Border.all(
      color: Colors.grey, // Border color
      width: 2.0, // Border width
    ),
    color: Colors.white, // Background color
  );
}

BoxDecoration arrowDecoration(){
  return BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: Color(0xffEDECFD)
  );
}
