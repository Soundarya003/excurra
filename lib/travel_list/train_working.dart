import 'package:flutter/material.dart';

class TrainWorking extends StatefulWidget {
  const TrainWorking({Key? key}) : super(key: key);

  @override
  State<TrainWorking> createState() => _TrainWorkingState();
}

class _TrainWorkingState extends State<TrainWorking> with AutomaticKeepAliveClientMixin<TrainWorking>{
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Bye', style: TextStyle(color: Colors.black),),);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
