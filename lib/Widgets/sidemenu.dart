import 'package:flutter/material.dart';
import 'package:excurra/constants.dart';
import 'package:excurra/Authentication/google_sign_in.dart';
import 'package:excurra/screens/wishlist_screen.dart';
import 'package:excurra/screens/travelHistory_screen.dart';

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
              GradientIcon(icon: Icons.favorite_outlined, size: 30),
              SizedBox(width: 13.0,),
              Text('Wishlist', style: kSideHeading,)
            ],
          ),
          onTap: () {
             Navigator.pushNamed(context, WishlistScreen.id);
          },
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
            Navigator.pushNamed(context, TravelHistoryScreen.id);
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
              GoogleSignInProvider().googleLogout(context);
          },
        ),

      ],
    );
  }
}

