import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

class IconMenu extends StatelessWidget {
  final String image;
  final String label;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double width;
  final double height;
  final GestureTapCallback onTap;

  const IconMenu(
    this.image,
    this.label, {
    Key key,
    this.padding = const EdgeInsets.only(top: 10.0),
    this.margin,
    this.width = 50.0,
    this.height = 50.0,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Themes.purple,
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            margin: margin,
            padding: padding,
            child: Column(
              children: [
                Image.asset(
                  image,
                  width: width,
                  height: height,
                  fit: BoxFit.scaleDown,
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
        ),
      ),
    );
  }
}
