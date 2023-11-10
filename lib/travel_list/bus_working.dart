import 'package:flutter/material.dart';

class BusWorking extends StatefulWidget {
  const BusWorking({Key? key}) : super(key: key);

  @override
  State<BusWorking> createState() => _BusWorkingState();
}

class _BusWorkingState extends State<BusWorking> with AutomaticKeepAliveClientMixin<BusWorking>{
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Hello', style: TextStyle(color: Colors.black),),);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
