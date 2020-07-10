import 'package:flutter/material.dart';

class ClickableTextUnderline extends StatelessWidget {
  final String data;
  final double fontSize;
  final TextAlign textAlign;
  final void Function() onPressed;
  final double paddingTop;
  final double paddingLeft;
  final double paddingRight;
  final double paddingBottom;
  final Color color;

  ClickableTextUnderline({
    Key key,
    @required this.data,
    @required this.onPressed,
    this.fontSize = 14.0,
    this.textAlign,
    this.paddingRight = 0.0,
    this.paddingLeft = 0.0,
    this.paddingBottom = 0.0,
    this.paddingTop = 0.0,
    this.color,
  }) : super(key: key);

  ClickableTextUnderline.tablet({
    Key key,
    @required this.data,
    @required this.onPressed,
    this.fontSize = 18.0,
    this.textAlign,
    this.paddingRight = 0.0,
    this.paddingLeft = 0.0,
    this.paddingBottom = 0.0,
    this.paddingTop = 0.0,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.red,
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(
            top: paddingTop,
            left: paddingLeft,
            right: paddingRight,
            bottom: paddingBottom),
        height: 30.0,
        child: Text(
          data,
          textAlign: textAlign,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: fontSize,
            color: color,
          ),
        ),
      ),
    );
    /*return InkWell(
      splashColor: Theme.of(context).accentColor,
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(
            top: paddingTop,
            left: paddingLeft,
            right: paddingRight,
            bottom: paddingBottom),
       // height: 30.0,
        child: Text(
          data,
          textAlign: textAlign,
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
        ),
      ),
    );*/
  }
}
