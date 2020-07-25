import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

class TextTitle extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  TextTitle(
    this.text, {
    this.textAlign = TextAlign.center,
    this.fontSize = 18.0,
    this.fontWeight = FontWeight.w800,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color ?? Themes.purpleDark,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
