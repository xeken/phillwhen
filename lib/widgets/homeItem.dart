import 'package:flutter/material.dart';
import 'package:medi/behaviors/emptyScrollBehavior.dart';

import 'badge.dart';

class HomeItem extends StatefulWidget {
  final String title;
  final List<Widget> listItems;
  final String badgeText;

  HomeItem({this.title, this.listItems, this.badgeText});

  @override
  _HomeItemState createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
  @override
  Widget build(BuildContext context) {
    var badge = widget.badgeText == null ? <Widget>[] : <Widget>[
      Badge(widget.badgeText),
      Padding(padding: EdgeInsets.only(left: 5.0)),
    ];

    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:30.0).copyWith(top: 10.0),
            child: Row(
              children: badge..add(Text(widget.title, style: Theme.of(context).textTheme.caption))
            ),
          ),
          SizedBox(
            height: 200.0,
            child: ScrollConfiguration(
              behavior: EmptyScrollBehavior(),
              // TODO: BOB - ListView 고정말고, 그냥 child 로 받자.
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                children: widget.listItems
              ),
            )
          )
        ]
      ),
    );
  }
}
