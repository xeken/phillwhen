import 'package:flutter/material.dart';
import 'package:pillwhen/behaviors/emptyScrollBehavior.dart';
import 'package:pillwhen/models/MyPillInfo.dart';
import 'package:pillwhen/widgets/card.dart';
import 'package:pillwhen/widgets/homeItem.dart';

import 'MyPillAddInfo.dart';

class MyPill extends StatefulWidget {
  @override
  _MyPillState createState() => _MyPillState();
}

class _MyPillState extends State<MyPill> {

  List<MyPillInfo> _myPillInfo;

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
                      child: Text('DSKLKASDKSDASDL'),
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=> MyPillAddInfo(myPillInfo: _myPillInfo.elementAt(1)))
                        );
                      },
                    ),
                    Padding(padding: EdgeInsets.only(right: 10.0)),
                    PwCard(
                      child: Text('ㅁㄴㅇㄴ루ㅏㅁㄴ루ㅏㄴㅁㄹ'),
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=> MyPillAddInfo(myPillInfo: _myPillInfo.elementAt(1)))
                        );
                      },
                    ),
                    Padding(padding: EdgeInsets.only(right: 10.0)),
                    PwCard(
                      child: Text('ㄴ윌뮈프ㅐㅔㄷ믐ㅍ페프ㅐ페ㅔ'),
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=> MyPillAddInfo(myPillInfo: _myPillInfo.elementAt(1)))
                        );
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
        onPressed: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=> MyPillAddInfo())
          );
        },
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }
}