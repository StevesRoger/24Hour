import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Function onPressed;
  final Color color;
  final String label;
  final double width;
  final double height;
  final double fontSize;

  const RoundButton({
    Key key,
    this.label,
    this.color,
    this.height = 45.0,
    this.width,
    this.fontSize = 18.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0),
        ),
        onPressed: onPressed,
        color: color,
        textColor: Colors.white,
        child: Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
