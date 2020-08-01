import 'package:flutter/material.dart';

class RoundRectangle extends StatelessWidget {
  final double width;
  final Color color;
  final double height;
  final Widget child;
  final BoxBorder border;
  final BorderRadiusGeometry borderRadius;
  final double paddingTop;
  final double paddingLeft;
  final double paddingRight;
  final double paddingBottom;
  final double marginTop;
  final double marginLeft;
  final double marginRight;
  final double marginBottom;
  final double paddingAll;
  final double marginAll;

  RoundRectangle({
    this.width = 100.0,
    this.height = 10.0,
    this.border,
    this.borderRadius,
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
    this.paddingAll,
    this.marginAll,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: paddingAll != null
          ? EdgeInsets.all(paddingAll)
          : EdgeInsets.only(
              top: marginTop,
              bottom: marginBottom,
              left: marginLeft,
              right: marginRight,
            ),
      padding: marginAll != null
          ? EdgeInsets.all(marginAll)
          : EdgeInsets.only(
              top: paddingTop,
              left: paddingLeft,
              right: paddingRight,
              bottom: paddingBottom,
            ),
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: border,
        color: color,
        shape: BoxShape.rectangle,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
