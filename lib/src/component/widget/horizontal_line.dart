import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  HorizontalLine({
    this.height = 3.0,
    this.width = 130.0,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: height,
      width: width,
      color: color,
    );
  }
}
