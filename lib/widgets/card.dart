import 'package:flutter/material.dart';

class PwCard extends StatefulWidget {
  final Widget child;
  final EdgeInsets padding;
  final BoxConstraints constraints;
  final Color backgroundColor;

  PwCard({
    this.child,
    this.padding = const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
    double width,
    double height,
    BoxConstraints constraints,
    this.backgroundColor
  }) : constraints =
      (width != null || height != null)
          ? constraints?.tighten(width: width, height: height)
          ?? BoxConstraints.tightFor(width: width, height: height)
          : constraints;

  @override
  _PwCardState createState() => _PwCardState();
}

class _PwCardState extends State<PwCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: widget.constraints,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [BoxShadow(color: Theme.of(context).primaryColorDark, blurRadius: 20.0, offset: Offset(0.0, 5.0))],
        color: widget.backgroundColor == null ? Theme.of(context).cardColor : widget.backgroundColor,
      ),
      padding: widget.padding,
      child: widget.child,
    );
  }
}
