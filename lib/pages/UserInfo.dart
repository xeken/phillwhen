import 'package:flutter/material.dart';
import 'package:pillwhen/models/User.dart';
import 'package:pillwhen/widgets/card.dart';
import 'package:pillwhen/widgets/peopleItem.dart';

class UserInfo extends StatefulWidget {
  final String name;

  UserInfo({Key key, this.name}) : super(key: key);
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    var profile = <Widget>[];
    var profiles = <String>["김대용","김동현","예두해"];
    User dummy = new User();
    for(var data in profiles)
    {
      dummy.makedata2();
      profile.add(PwCard(onTap:(){}, child: PeopleItem(image:Image.network(dummy.profileImageUri).image, name:dummy.name,desc:'test',)));
      profile.add(Padding(padding:EdgeInsets.only(top: 10.0)));
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50.0, bottom: 25.0),
              child:Text('${widget.name}씨의 정보', style: Theme.of(context).textTheme.title),

            ),
            Padding(
              padding:EdgeInsets.only(top:25.0, bottom:25.0),
              child:Text("${widget.name}씨가 즐겨찾기 중인 사람들", style:Theme.of(context).textTheme.body1)
            ),
            Column(
              children: profile,
            ),

          ],
        ),
      ),
    );
  }
}
