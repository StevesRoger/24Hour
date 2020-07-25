import 'package:flutter/material.dart';

class ScaffoldSafeArea extends StatelessWidget {
  final Alignment alignment;
  final Widget body;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final PreferredSizeWidget appBar;
  final Color color;

  ScaffoldSafeArea({
    this.alignment = Alignment.center,
    @required this.body,
    this.margin,
    this.padding,
    this.appBar,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Container(
          color: color,
          padding: padding,
          margin: margin,
          alignment: alignment,
          child: body,
        ),
      ),
    );
  }
}
