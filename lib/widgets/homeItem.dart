import 'package:flutter/material.dart';
import 'package:pillwhen/behaviors/emptyScrollBehavior.dart';

import 'badge.dart';

class HomeItem extends StatefulWidget {
  final String title;
  final Widget child;
  final String badgeText;

  HomeItem({this.title, this.child, this.badgeText});

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
            widget.child
          ]
      ),
    );
  }
}