import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pillwhen/behaviors/emptyScrollBehavior.dart';
import 'package:pillwhen/widgets/peopleItem.dart';
import 'package:pillwhen/widgets/card.dart';
import 'package:pillwhen/widgets/homeItem.dart';

class People extends StatefulWidget {
  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  @override
  Widget build(BuildContext context) {
    var profile = <Widget>[];
    var profiles = <String>["김대용","김동현","예두해"];
    for(var data in profiles)
    {
      profile.add(PwCard(onTap:(){},child: PeopleItem(image:Image.network('https://scontent-icn1-1.xx.fbcdn.net/v/t1.0-9/32508762_606806973014817_9098627413276884992_o.jpg?_nc_cat=101&_nc_oc=AQm3rfLuQFqNXWTwzKesqM860EJMhtOTraxwhypoUE9-qU2t9z8I3liU9CF7_NEFcDk&_nc_ht=scontent-icn1-1.xx&oh=95bb70124ab9a7e5f4869b16316b3c74&oe=5D79DE07').image, name:data,desc:'test',)));
      profile.add(Padding(padding:EdgeInsets.only(top: 10.0)));
    }

    return Container(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50.0),
            child:Text('즐겨찾는 사람들', style: TextStyle(fontSize: 25.0)),

          ),
          Column(
              children:profile,
            ),

        ],
      ),
    );
  }
}
