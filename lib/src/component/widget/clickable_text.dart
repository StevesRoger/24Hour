import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

class ClickableTextUnderline extends StatelessWidget {
  final String data;
  final double fontSize;
  final TextAlign textAlign;
  final void Function() onPressed;
  final double paddingTop;
  final double paddingLeft;
  final double paddingRight;
  final double paddingBottom;
  final double marginTop;
  final double marginLeft;
  final double marginRight;
  final double marginBottom;
  final Color color;

  ClickableTextUnderline({
    Key key,
    @required this.data,
    @required this.onPressed,
    this.fontSize = 14.0,
    this.textAlign = TextAlign.center,
    this.paddingRight = 0.0,
    this.paddingLeft = 0.0,
    this.paddingBottom = 0.0,
    this.paddingTop = 0.0,
    this.marginBottom = 0.0,
    this.marginLeft = 0.0,
    this.marginRight = 0.0,
    this.marginTop = 0.0,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Themes.purple,
        onTap: onPressed,
        child: Container(
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
          height: 30.0,
          child: Text(
            data,
            textAlign: textAlign,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: fontSize,
              color: color ?? Themes.purpleDark,
            ),
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
