import 'package:flutter/material.dart';

class AsAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/header-logo.png',
            height: 35.0,
            fit: BoxFit.scaleDown,
          ),
        ),
      ],
    );
  }
}
