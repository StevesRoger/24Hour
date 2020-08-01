import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final double paddingAll;
  final double marginAll;
  final double paddingTop;
  final double paddingLeft;
  final double paddingRight;
  final double paddingBottom;
  final double marginTop;
  final double marginLeft;
  final double marginRight;
  final double marginBottom;

  const Circle({
    Key key,
    this.width = 15.0,
    this.height = 15.0,
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
    this.color = Colors.black12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
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
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
    /*return Padding(
      padding: EdgeInsets.all(5.0),
      child: SizedBox(
        width: 15.0,
        height: 15.0,
        child: CustomPaint(
          painter: CirclePainter(
            color: color,
          ),
        ),
      ),
    );*/
  }
}
