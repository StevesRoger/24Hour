import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Function onPressed;
  final Color color;
  final String label;
  final double width;
  final double height;
  final double fontSize;
  final double paddingTop;
  final double paddingLeft;
  final double paddingRight;
  final double paddingBottom;
  final double marginTop;
  final double marginLeft;
  final double marginRight;
  final double marginBottom;

  const RoundButton({
    Key key,
    this.label,
    this.color,
    this.height = 47.0,
    this.width,
    this.fontSize = 18.0,
    this.onPressed,
    this.paddingRight = 0.0,
    this.paddingLeft = 0.0,
    this.paddingBottom = 0.0,
    this.paddingTop = 0.0,
    this.marginBottom = 0.0,
    this.marginLeft = 45.0,
    this.marginRight = 45.0,
    this.marginTop = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0),
        ),
        onPressed: onPressed,
        color: color,
        textColor: Colors.white,
        child: Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
