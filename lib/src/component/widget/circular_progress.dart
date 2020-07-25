import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

class CircularProgress extends StatelessWidget {
  final Color backgroundColor;
  final Color color;

  CircularProgress({
    this.backgroundColor,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return isAndroid()
        ? CircularProgressIndicator(
            backgroundColor: backgroundColor ?? Themes.purple,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          )
        : CupertinoActivityIndicator();
  }
}
