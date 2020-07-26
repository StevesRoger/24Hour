import 'package:flutter/material.dart';

class RoundRectangle extends StatelessWidget {
  final double width;
  final Color color;
  final double height;
  final Widget child;
  final double radius;
  final BoxBorder border;
  final double paddingTop;
  final double paddingLeft;
  final double paddingRight;
  final double paddingBottom;
  final double marginTop;
  final double marginLeft;
  final double marginRight;
  final double marginBottom;

  RoundRectangle({
    this.width = 100.0,
    this.height = 10.0,
    this.radius = 0.0,
    this.border,
    this.color,
    this.child,
    this.paddingRight = 0.0,
    this.paddingLeft = 0.0,
    this.paddingBottom = 0.0,
    this.paddingTop = 0.0,
    this.marginBottom = 0.0,
    this.marginLeft = 0.0,
    this.marginRight = 0.0,
    this.marginTop = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        top: marginTop,
        bottom: marginBottom,
        left: marginLeft,
        right: marginRight,
      ),
      padding: EdgeInsets.only(
        top: paddingTop,
        left: paddingLeft,
        right: paddingRight,
        bottom: paddingBottom,
      ),
      width: width,
      height: height,
      decoration: new BoxDecoration(
        border: border,
        color: color,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
      child: child,
    );
  }
}
