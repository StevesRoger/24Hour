import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

class GradientPanel extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;

  GradientPanel({
    this.child,
    this.height = 30.0,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: child,
      width: width,
      height: percentHeight(context, height),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Themes.purple, Themes.purpleDark],
          stops: [0.0, 0.6],
        ),
      ),
    );
  }
}
