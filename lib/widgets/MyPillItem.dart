import 'package:flutter/material.dart';

class MyPillItem extends StatefulWidget {
  final String nickname;
  final int pillNum;
  final DateTime takingTime;

  const MyPillItem({Key key, this.nickname, this.pillNum, this.takingTime}) : super(key: key);


  @override
  _MyPillItemState createState() => _MyPillItemState();
}

class _MyPillItemState extends State<MyPillItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 10.0),),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.nickname),
                Text(widget.pillNum.toString()),
                Text(widget.takingTime.year.toString()+"." +widget.takingTime.month.toString() +"."+widget.takingTime.day.toString())
              ],
            ),
          )
        ],
      ),
    );
  }
}
