import 'package:flutter/material.dart';

class IconMenu extends StatelessWidget {
  final String image;
  final String label;
  final EdgeInsetsGeometry padding;
  final double width;
  final double height;

  const IconMenu(
    this.image,
    this.label, {
    Key key,
    this.padding = const EdgeInsets.all(5.0),
    this.width = 50.0,
    this.height = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                image,
                width: width,
                height: height,
                fit: BoxFit.scaleDown,
              ),
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
