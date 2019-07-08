import 'package:flutter/material.dart';

class PeopleItem extends StatefulWidget {
  final ImageProvider image;
  final String name;
  final String desc;

  PeopleItem({this.image, this.name, this.desc});

  @override
  _PeopleItemState createState() => _PeopleItemState();
}

class _PeopleItemState extends State<PeopleItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              image: DecorationImage(image: widget.image)
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 10.0),),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.name),
                Text(widget.desc)
              ],
            ),
          )
        ],
      ),
    );
  }
}
