import 'package:flutter/material.dart';

class ScaffoldSafeArea extends StatelessWidget {
  final Alignment alignment;
  final Widget body;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final PreferredSizeWidget appBar;
  final Color backgroundColor;
  final bool resizeToAvoidBottomPadding;

  ScaffoldSafeArea({
    this.alignment = Alignment.center,
    @required this.body,
    this.margin,
    this.padding,
    this.appBar,
    this.resizeToAvoidBottomPadding = true,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomPadding: resizeToAvoidBottomPadding,
      appBar: appBar,
      body: SafeArea(
        child: Container(
          padding: padding,
          margin: margin,
          alignment: alignment,
          color: backgroundColor,
          child: body,
        ),
      ),
    );
  }
}
