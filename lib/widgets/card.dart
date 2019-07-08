import 'package:flutter/material.dart';

class PwCard extends StatefulWidget {
  @override
  _PwCardState createState() => _PwCardState();
}

// TODO: BOB - 앞으로 값 받아서 화면에 띄우게 만들어야함.
class _PwCardState extends State<PwCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20.0, offset: Offset(0.0, 5.0))],
        color: Theme.of(context).primaryColor,
      ),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Text("안녕하세요, 여기는 서울임"),
    );
  }
}
