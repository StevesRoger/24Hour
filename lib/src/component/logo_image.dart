import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  LogoImage(
      {this.margin = const EdgeInsets.only(
        left: 35.0,
        right: 50.0,
        bottom: 20.0,
      ),
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: margin,
      child: Image.asset(
        "assets/images/register-login-logo.png",
      ),
    );
  }
}
