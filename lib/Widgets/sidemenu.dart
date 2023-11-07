import 'package:flutter/material.dart';
import 'package:excurra/constants.dart';

class SideMenu extends StatelessWidget {
  late String name, email, user;
  SideMenu({required this.name, required this.email, required this.user});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      backgroundColor: Colors.white,
      elevation: 2,
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xFFFBFCF8),
          ),
          accountName: Text(name, style: kSideHeading,),
          accountEmail: Text(email, style: kSideEmailHeading,),
          currentAccountPicture: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(user)
          ),
        ),
        ListTile(
          title: Row(
            children: [
              GradientIcon(icon: Icons.history, size: 30),
              SizedBox(width: 13.0,),
              Text('Travel History', style: kSideHeading,)
            ],
          ),
          onTap: () {
            // Handle item 1 click
          },
        ),
        ListTile(
          title: Row(
            children: [
              GradientIcon(icon: Icons.logout, size: 30),
              SizedBox(width: 13.0,),
              Text('Sign out', style: kSideHeading,)
            ],
          ),
          onTap: () {
            // Handle item 2 click
          },
        ),
      ],
    );
  }
}


class GradientIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  GradientIcon({
    required this.icon,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final Gradient gradient = LinearGradient(
      begin: Alignment(-1.224, -1),
      end: Alignment(1, 0.667),
      colors: <Color>[Color(0xfffb4a4a), Color(0xff2026cc)],
      stops: <double>[0, 1],
    );

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
