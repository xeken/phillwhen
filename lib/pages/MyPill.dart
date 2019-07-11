import 'package:flutter/material.dart';
import 'package:pillwhen/behaviors/emptyScrollBehavior.dart';
import 'package:pillwhen/models/User.dart';

import 'package:pillwhen/widgets/MyPillItem.dart';
import 'package:pillwhen/widgets/card.dart';

import 'MyPillAddInfo.dart';

class MyPill extends StatefulWidget {
  @override
  _MyPillState createState() => _MyPillState();
}

class _MyPillState extends State<MyPill> {
  var pillInfoList = Set<PillInfo>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 200,
            child: ScrollConfiguration(
              behavior: EmptyScrollBehavior(),
              child: ListView(
                  scrollDirection: Axis.vertical,
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0)
                          .copyWith(bottom: 50.0),
                  children: _buildInfo(pillInfoList)),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MyPillAddInfo(
                  btnText: "추가하기",
                  pillInfo: PillInfo(),
                  pillInfoList: pillInfoList)));
        },
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }

  List<Widget> _buildInfo(Set<PillInfo> list) {
    return list.map((e) {
      return Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: PwCard(
              child: MyPillItem(
                nickname: e.nickname,
                pillNum: e.remainEat,
                takingTime: e.time,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  var a = new PillInfo();
//                  a.nickName = 'asdf';
                  a.remainEat = e.remainEat;
                  a.time = e.time;
                  pillInfoList.add(a);
                  return MyPillAddInfo(pillInfo: e);
                }));
              }));
    }).toList();
  }
}
