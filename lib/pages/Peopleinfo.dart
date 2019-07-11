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

class _PeopleInfoState extends State<PeopleInfo> {
  @override
  Widget build(BuildContext context) {
    var profile = <Widget>[];
    var profiles = <String>["김대용","김동현","예두해"];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50.0, bottom: 25.0),
            child:Text('즐겨찾는 사람들', style: Theme.of(context).textTheme.title),
          ),
          Column(
            children:profile,
          ),

        ],
      ),
    );
  }
}
