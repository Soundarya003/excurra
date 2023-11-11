import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResortWorking extends StatefulWidget {
  late Map<String, String> accumulatedData;
  ResortWorking({required this.accumulatedData});
  @override
  State<ResortWorking> createState() => _ResortWorkingState();
}

class _ResortWorkingState extends State<ResortWorking> {
  var jsonData;
  Future<void> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('json/resort_data.json');
    var data = jsonDecode(jsonString);
    setState(() {
      jsonData = data;
    });
    //print(jsonData);
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonAsset();
  }
  @override
  Widget build(BuildContext context) {
    final accumulatedData = widget.accumulatedData;
    if (jsonData == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Container();
  }
}
