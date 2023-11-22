import 'package:excurra/Widgets/create_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:excurra/screens/welcome.dart';

class TravelHistoryScreen extends StatefulWidget {
  const TravelHistoryScreen({Key? key}) : super(key: key);
  static const String id = 'travelHistory_screen';
  @override
  State<TravelHistoryScreen> createState() => _TravelHistoryScreenState();
}

class _TravelHistoryScreenState extends State<TravelHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final List<dynamic> mainList = ModalRoute.of(context)?.settings.arguments as List<dynamic>;
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
                          builder: (context) => TravelData(mainList: mainList),
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

class TravelData extends StatelessWidget {
  static const String id = 'data_screen';
  late List<dynamic> mainList;
  TravelData({required this.mainList});

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