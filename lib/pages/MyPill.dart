import 'package:flutter/material.dart';
import 'package:pillwhen/behaviors/emptyScrollBehavior.dart';
import 'package:pillwhen/models/PillInfo.dart';
import 'package:pillwhen/widgets/MyPillItem.dart';
import 'package:pillwhen/widgets/card.dart';
import 'package:pillwhen/widgets/homeItem.dart';

import 'MyPillAddInfo.dart';

class MyPill extends StatefulWidget {
  @override
  _MyPillState createState() => _MyPillState();
}

class _MyPillState extends State<MyPill> {
  //var a = new PillInfo("아침 감기약", new DateTime(2019, 7,10), 3);
  //var b = new PillInfo("점심 영양제쨩", new DateTime(2019, 7,9), 6);
  //var c = new PillInfo("저녁 감기약", new DateTime(2019, 7,10), 3);
//  var pillInfo1 = new PillInfo();
//  pillInfo1.key = 1;;
//  pillInfo1.remainingPills = 5;
//  pillInfo1.time = TimeOfDay.now();
  var pillInfoList = <PillInfo>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          HomeItem(
            title: '내가 먹는 약',
            child: SizedBox(
              height: 200,
              child: ScrollConfiguration(
                behavior: EmptyScrollBehavior(),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0)
                          .copyWith(bottom: 25.0),
                  children: <Widget>[
                    PwCard(
                      child: MyPillItem(
                        nickname: "아침 감기약",
                        pillNum: 3,
                        takingTime: new DateTime(2019, 7, 10),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          var a = new PillInfo();
                          a.nickName = "아침 감기약";
                          a.pillCount = 3;
                          a.dateTime = new DateTime(2019, 7, 10);
                          pillInfoList.add(a);
                          print("asdasds" +pillInfoList.toString());
                          return MyPillAddInfo(pillInfo: pillInfoList.elementAt(0));
                        }));
                      },
                    ),
                    Padding(padding: EdgeInsets.only(right: 10.0)),
                    PwCard(
                      child: Text('ㅁㄴㅇㄴ루ㅏㅁㄴ루ㅏㄴㅁㄹ'),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyPillAddInfo(
                                pillInfo: pillInfoList.elementAt(1))));
                      },
                    ),
                    Padding(padding: EdgeInsets.only(right: 10.0)),
                    PwCard(
                      child: Text('ㄴ윌뮈프ㅐㅔㄷ믐ㅍ페프ㅐ페ㅔ'),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyPillAddInfo(
                                pillInfo: pillInfoList.elementAt(2))));
                      },
                    ),
                  ],
                ),
              ),
            ),
            badgeText: "2",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MyPillAddInfo(pillInfoList: pillInfoList)));
        },
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }
}
