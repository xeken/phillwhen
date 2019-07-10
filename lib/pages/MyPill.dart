import 'package:flutter/material.dart';
import 'package:pillwhen/behaviors/emptyScrollBehavior.dart';
import 'package:pillwhen/widgets/card.dart';
import 'package:pillwhen/widgets/homeItem.dart';

class MyPill extends StatefulWidget {
  @override
  _MyPillState createState() => _MyPillState();
}

class _MyPillState extends State<MyPill> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(children: <Widget>[
      TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '약약약약'),
      ),
      HomeItem(
        title: '내가 먹는 약',
        child: SizedBox(
            height: 200,
            child: ScrollConfiguration(
              behavior: EmptyScrollBehavior(),
              child: ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0)
                    .copyWith(bottom: 25.0),
                children: <Widget>[
                  PwCard(
                    child: Text('DSKLKASDKSDASDL'),
                  ),
                  Padding(padding: EdgeInsets.only(right: 10.0)),
                  PwCard(
                    child: Text('ㅁㄴㅇㄴ루ㅏㅁㄴ루ㅏㄴㅁㄹ'),
                  ),
                  Padding(padding: EdgeInsets.only(right: 10.0)),
                  PwCard(
                    child: Text('ㄴ윌뮈프ㅐㅔㄷ믐ㅍ페프ㅐ페ㅔ'),
                  ),
                ],
              ),
            )),
        badgeText: "2",
      ),
    ]));
  }
}
