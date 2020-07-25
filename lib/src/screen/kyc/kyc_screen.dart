import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/component/gradient_panel.dart';
import 'package:twentyfour_hour/src/component/scaffold_safe_area.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

class KycScreen extends StatefulWidget {
  @override
  _KycScreenState createState() => _KycScreenState();
}

class _KycScreenState extends State<KycScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldSafeArea(
        backgroundColor: Themes.purpleDark,
        body: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () {Navigator.pop(context);},
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/images/header-logo.png"),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.notifications_active,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
              GradientPanel(),
            ],
          ),
        ));
  }
}
