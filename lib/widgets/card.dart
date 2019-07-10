import 'package:flutter/material.dart';

class PwCard extends StatefulWidget {
  final Widget child;
  final EdgeInsets padding;
  final BoxConstraints constraints;
  final BorderRadius borderRadius;

  final Color shadowColor;
  final Color backgroundColor;

  final GestureTapCallback onTap;
  final GestureTapCallback onDoubleTap;
  final GestureLongPressCallback onLongPress;
  final GestureTapDownCallback onTapDown;
  final GestureTapCancelCallback onTapCancel;

  PwCard({
    this.child,
    this.padding = const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    double width,
    double height,
    BoxConstraints constraints,
    this.shadowColor,
    this.backgroundColor,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapCancel,
    this.onTapDown
  }) : assert(child != null),
        assert(padding != null),
        assert(borderRadius != null),
        constraints =
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
    var backgroundColor = widget.backgroundColor == null ? Theme.of(context).cardColor : widget.backgroundColor;
    var shadowColor = widget.shadowColor == null ? Theme.of(context).primaryColorDark : widget.shadowColor;

    return Container(
        constraints: widget.constraints,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          boxShadow: [BoxShadow(color: shadowColor, blurRadius: 15.0, offset: Offset(0.0, 8.0))],
          color: backgroundColor,
        ),
        child: Material(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: widget.borderRadius),
          child: InkWell(
            onTap: widget.onTap,
            onLongPress: widget.onLongPress,
            onDoubleTap: widget.onDoubleTap,
            onTapDown: widget.onTapDown,
            onTapCancel: widget.onTapCancel,
            borderRadius: widget.borderRadius,
            child: Container(
              padding: widget.padding,
              child: widget.child,
            ),
          ),
        )
    );
  }
}