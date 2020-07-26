import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

import 'round_rectangle.dart';

class EarningProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: <Widget>[
          Rectangle(width: 250.0, radius: 10.0, color: Themes.purple),
          Rectangle(width: 125.0, radius: 10.0, color: Themes.blueColor),
        ],
      ),
    );
  }
}
