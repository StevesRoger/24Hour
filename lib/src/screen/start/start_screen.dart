import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/component/widget/round_button.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(10.0),
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    left: 35.0,
                    right: 45.0,
                    bottom: 50.0,
                  ),
                  child: Image.asset(
                    "assets/images/register-login-logo.png",
                  ),
                ),
                RoundButton(
                  marginBottom: 20.0,
                  color: Themes.purpleDark,
                  label: Strings.SIGN_UP,
                  onPressed: () => Navigator.pushNamed(context, Routes.SIGN_UP),
                ),
                RoundButton(
                  color: Themes.pinkColor,
                  label: Strings.LOGIN,
                  onPressed: () => Navigator.pushNamed(context, Routes.LOGIN),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
