import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pillwhen/behaviors/emptyScrollBehavior.dart';
import 'package:pillwhen/widgets/peopleItem.dart';
import 'package:pillwhen/widgets/card.dart';
import 'package:pillwhen/widgets/homeItem.dart';
import 'package:pillwhen/models/User.dart';

import 'UserInfo.dart';
class People extends StatefulWidget {
  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  @override
  Widget build(BuildContext context) {
    var profile = <Widget>[];
    var profiles = <String>["김대용","김동현","예두해"];
    User dummy = new User();
    for(var data in profiles)
    {
      dummy.makedata();
      profile.add(
          PwCard(onTap:(){var route = new MaterialPageRoute(
            builder: (BuildContext context) =>
            new UserInfo(name: dummy.name),
          );
          Navigator.of(context).push(route);
          }, child: PeopleItem(image:Image.network(dummy.profileImageUri).image, name:dummy.name,desc:'test',)));
      profile.add(Padding(padding:EdgeInsets.only(top: 10.0)));
    }

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
