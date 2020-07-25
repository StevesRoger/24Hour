import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

class GradientPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
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
