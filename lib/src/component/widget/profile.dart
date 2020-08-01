import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String src;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double height;
  final double weight;

  Profile({
    this.src = 'assets/images/profile-logo.png',
    this.margin,
    this.padding = const EdgeInsets.all(2.0),
    this.height = 70.0,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Image.asset(
        src,
        height: height,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
