import 'package:flutter/material.dart';

class Badge extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final double height;
  final double minWidth;

  Badge(this.text, { this.backgroundColor, this.height = 22.5, this.minWidth = 22.5 });

  @override
  _BadgeState createState() => _BadgeState();
}

class _BadgeState extends State<Badge> {
  @override
  Widget build(BuildContext context) {
    var backgroundColor = widget.backgroundColor == null ? Theme.of(context).colorScheme.primary : widget.backgroundColor;
    return Container(
        constraints: BoxConstraints(minWidth: widget.minWidth),
        height: widget.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            color: backgroundColor
        ),
        child: Center(
            child: Text(
              widget.text,
              style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white, fontSize: 15.0),
            )
        )
    );
  }
}