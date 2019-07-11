import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pillwhen/behaviors/emptyScrollBehavior.dart';
import 'package:pillwhen/widgets/peopleItem.dart';
import 'package:pillwhen/widgets/card.dart';
import 'package:pillwhen/widgets/homeItem.dart';
import 'package:pillwhen/models/User.dart';

import 'UserInfo.dart';
class PeopleInfo extends StatefulWidget {
  @override
  _PeopleInfoState createState() => _PeopleInfoState();
}

Future<String> _asyncInputDialog(BuildContext context) async {
  String teamName = '';
  return showDialog<String>(
    context: context,
    barrierDismissible: false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('즐겨찾기할 사람의 코드를 입력해주세요.',style: Theme.of(context).textTheme.body2),
        content: new Row(
          children: <Widget>[
            new Expanded(
                child: new TextField(
                  autofocus: true,
                  decoration: new InputDecoration(
                      labelText: 'Team Name', hintText: ''),
                  onChanged: (value) {
                    teamName = value;
                  },
                ))
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(teamName);
            },
          ),
        ],
      );
    },
  );
}
class _PeopleInfoState extends State<PeopleInfo> {
  var profiles  = <String>[];
  var images = <String>["https://sample-videos.com/img/Sample-jpg-image-500kb.jpg","https://miro.medium.com/max/1200/1*ilC2Aqp5sZd1wi0CopD1Hw.png","http://i.dailymail.co.uk/i/pix/2015/09/01/18/2BE1E88B00000578-3218613-image-m-5_1441127035222.jpg","https://sample-videos.com/img/Sample-jpg-image-500kb.jpg"];
  Random ran = new Random(100);
  @override
  void initState() {
    super.initState();
  }

  List<Widget> createProfileListWidget() {
    var profile = <Widget>[];

    User dummy = new User();

    for(var data in profiles)
    {
      int cnt = ran.nextInt(10)%4;
      print(cnt);
      dummy.makedata();
      profile.add(
          PwCard(onTap:(){var route = new MaterialPageRoute(
            builder: (BuildContext context) =>
            new UserInfo(name: data),
          );
          Navigator.of(context).push(route);
          }, child: PeopleItem(image:Image.network(images[cnt]).image, name:data,desc:'test',)));
      profile.add(Padding(padding:EdgeInsets.only(top: 10.0)));
    }

    return profile;
  }

  @override
  Widget build(BuildContext context) {
    int cnt = 0;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50.0, bottom: 25.0),
              child:Text('즐겨찾는 사람들', style: Theme.of(context).textTheme.title),
            ),
            Column(
              children: createProfileListWidget(),
            ),
          ],
        ),

      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String code = await _asyncInputDialog(context);

            setState(() {
              profiles.add(code);
            });
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.pink,
        ),
    );

  }
}
