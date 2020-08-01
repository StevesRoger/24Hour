import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

import 'package:twentyfour_hour/src/component/widget/round_rectangle.dart';

class EarningProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: <Widget>[
          RoundRectangle(
              width: 250.0,
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Themes.purple),
          RoundRectangle(
              width: 125.0,
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Themes.blueColor),
        ],
      ),
    );
  }
}
