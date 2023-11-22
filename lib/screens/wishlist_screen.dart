import 'package:excurra/Widgets/create_button.dart';
import 'package:flutter/material.dart';
import 'package:excurra/screens/welcome.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);
  static const String id = 'wishlist_screen';

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final List<Map<String, String>> mainList = [
    {
      'activity_place': 'Park',
      'activity_description': 'Enjoy a day at the park',
      'activity_category': 'Outdoor',
    },
    {
      'activity_place': 'Museum',
      'activity_description': 'Explore historical artifacts',
      'activity_category': 'Indoor',
    },
    // Add more items as needed
  ];
  @override
  Widget build(BuildContext context) {
    // final List<dynamic> mainList = ModalRoute.of(context)?.settings.arguments as List<dynamic>;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              CreateButton(
                  buttonName: 'Hello',
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DataScreen(mainList: mainList),
                      ),
                    );
                  }
              )
            ],
          ),
        )
      ),
    );
  }
}

class DataScreen extends StatelessWidget {
  static const String id = 'data_screen';
  late List<dynamic> mainList;
  DataScreen({required this.mainList});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: mainList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              child: ListTile(
                title: Text(mainList[index]['activity_place'], style: TextStyle(color: Colors.black)),
                subtitle: Text(mainList[index]['activity_description'], style: TextStyle(color: Colors.black)),
                trailing: Text(mainList[index]['activity_category'], style: TextStyle(color: Colors.black)),
                onTap: () {
                  print('Item tapped: ${mainList[index]}');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

