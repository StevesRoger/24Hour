import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/screen/login/login_screen.dart';
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
                Padding(
                  padding: const EdgeInsets.only(left: 45.0, right: 45.0),
                  child: SizedBox(
                    height: 45.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      onPressed: () {},
                      color: Themes.purpleDark,
                      textColor: Colors.white,
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45.0, right: 45.0),
                  child: SizedBox(
                    height: 45.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      color: Themes.pinkColor,
                      textColor: Colors.white,
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
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
