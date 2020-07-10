import 'package:flutter/material.dart';

import '../../dummy.dart';

class Circle extends StatelessWidget {
  final Color color;

  const Circle({Key key, this.color = Colors.black12}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
