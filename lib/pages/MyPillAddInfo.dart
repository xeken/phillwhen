import 'package:flutter/material.dart';
import 'package:pillwhen/models/PillInfo.dart';

class MyPillAddInfo extends StatefulWidget {
  final PillInfo pillInfo;
  final List<PillInfo> pillInfoList;

  const MyPillAddInfo({Key key, this.pillInfo, this.pillInfoList})
      : super(key: key);

  @override
  _MyPillAddInfoState createState() => _MyPillAddInfoState();
}

class _MyPillAddInfoState extends State<MyPillAddInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: '별명'),
            ),
            TextField(
              decoration: InputDecoration(hintText: '약 갯수'),
            ),
            TextField(
              decoration: InputDecoration(hintText: '시간'),
            )
          ],
        ),
      ),
    );
  }
}
