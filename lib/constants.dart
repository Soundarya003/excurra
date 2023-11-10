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

const kPreferenceTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 20.0,
    fontFamily: 'Poppins-light'
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

const kHeading1 = TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w800);

const kHeading2 = TextStyle(color: Colors.black, fontSize: 12.0);

const kSmallHeading = TextStyle(fontSize: 12.0);

BoxDecoration mainBoxDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(24.0),
    boxShadow: [
      BoxShadow(
        color: Colors.grey, // Shadow color
        offset: Offset(-5, -5), // Offset for the top-left shadow
        blurRadius: 5, // Blur radius
      ),
      BoxShadow(
        color: Colors.grey, // Shadow color
        offset: Offset(5, 5), // Offset for the bottom-right shadow
        blurRadius: 5, // Blur radius
      ),
    ],
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

const kSideHeading = TextStyle(
    fontFamily: 'Poppins-Light',
    fontWeight: FontWeight.w700,
    fontSize: 18.0,
    color: Colors.black
);

const kSideEmailHeading = TextStyle(
    fontFamily: 'Poppins-Light',
    fontWeight: FontWeight.w700,
    fontSize: 14.0,
    color: Colors.black
);

const kTraveller = TextStyle(
    fontFamily: 'Poppins-Light',
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    color: Colors.black
);

const purpleGradient = LinearGradient (
  begin:  Alignment(-1.224, -1),
  end:  Alignment(1, 0.667),
  colors:  <Color>[Color(0xfffb4a4a), Color(0xff2026cc)],
  stops:  <double>[0, 1],
);

class GradientIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  GradientIcon({
    required this.icon,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final Gradient gradient = purpleGradient;
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
      child: Icon(
        icon,
        size: size,
        color: Colors.white, // This color will be overridden by the gradient
      ),
    );
  }
}
