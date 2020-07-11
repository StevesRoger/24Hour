import 'package:flutter/material.dart';

class VDivider extends StatelessWidget {
  final double height;
  final Color color;

  const VDivider({
    Key key,
    this.height = 40,
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: VerticalDivider(
        color: color,
      ),
    );
  }
}
