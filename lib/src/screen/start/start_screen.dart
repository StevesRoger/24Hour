import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/component/widget/round_button.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
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
                Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 45.0),
                  child: Image.asset(
                    "assets/images/register-login-logo.png",
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                _buildButton(
                  Themes.purpleDark,
                  Strings.SIGN_UP,
                  () => Navigator.pushNamed(context, Routes.SIGN_UP),
                ),
                SizedBox(
                  height: 25.0,
                ),
                _buildButton(
                  Themes.pinkColor,
                  Strings.LOGIN,
                  () => Navigator.pushNamed(context, Routes.LOGIN),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(Color color, String label, Function onPressed) {
    return Padding(
      padding: const EdgeInsets.only(left: 45.0, right: 45.0),
      child: RoundButton(
        color: color,
        label: label,
        onPressed: onPressed,
      ),
    );
  }
}
