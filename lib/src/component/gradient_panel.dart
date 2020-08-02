import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

class GradientPanel extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final BorderRadius borderRadius;
  final double paddingTop;
  final double paddingLeft;
  final double paddingRight;
  final double paddingBottom;
  final double marginTop;
  final double marginLeft;
  final double marginRight;
  final double marginBottom;
  final Gradient gradient;
  final AlignmentGeometry alignment;
  final double begin;
  final double end;

  GradientPanel({
    this.child,
    this.height = 30.0,
    this.width,
    this.borderRadius,
    this.paddingRight = 0.0,
    this.paddingLeft = 0.0,
    this.paddingBottom = 0.0,
    this.paddingTop = 0.0,
    this.marginBottom = 0.0,
    this.marginLeft = 0.0,
    this.marginRight = 0.0,
    this.marginTop = 0.0,
    this.begin = 0.0,
    this.end = 0.6,
    this.gradient,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
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
      child: child,
      width: width,
      height: percentHeight(context, height),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: gradient ??
            LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Themes.purple, Themes.purpleDark],
              stops: [begin, end],
            ),
      ),
    );
  }
}
