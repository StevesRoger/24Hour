import 'package:flutter/material.dart';

class RoundRectangle extends StatelessWidget {
  final double width;
  final Color color;
  final double height;
  final Widget child;
  final double radius;
  final BoxBorder border;

  RoundRectangle({
    this.width,
    this.height = 10.0,
    this.child,
    this.radius = 10.0,
    this.border,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
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
