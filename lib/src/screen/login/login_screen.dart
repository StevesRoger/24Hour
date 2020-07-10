import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:twentyfour_hour/src/component/widget/clickable_text.dart';
import 'package:twentyfour_hour/src/screen/home/home_screen.dart';
import 'package:twentyfour_hour/src/service/authentication_service.dart';
import 'package:twentyfour_hour/src/service/user_profile_service.dart';
import 'package:twentyfour_hour/src/util/common_function.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/hex_color.dart';
import 'package:twentyfour_hour/src/util/shared_pref.dart';

class LoginScreen extends StatelessWidget {
  final passwordCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final authService = AuthenticationService();
  final userService = UserProfileService();
  var pr;

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context);
    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (BuildContext context) => Container(
            color: HexColor("#f1f1f6"),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(10.0),
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0, right: 50.0),
                    child: Image.asset(
                      "assets/images/register-login-logo.png",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Text(
                      "MEMBER LOGIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Themes.purpleDark,
                        fontWeight: FontWeight.w800,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      left: 40.0,
                      right: 40.0,
                    ),
                    child: SizedBox(
                      height: 45.0,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'ID or E-mail',
                          contentPadding: const EdgeInsets.all(5.0),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(40.0),
                            ),
                          ),
                          //fillColor: Colors.white24,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25.0,
                      left: 40.0,
                      right: 40.0,
                    ),
                    child: SizedBox(
                      height: 45.0,
                      child: TextField(
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        textAlign: TextAlign.center,
                        controller: passwordCtrl,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Password',
                          contentPadding: const EdgeInsets.all(5.0),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(40.0),
                            ),
                          ),
                          //fillColor: Colors.white24,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25.0,
                      left: 45.0,
                      right: 45.0,
                    ),
                    child: SizedBox(
                      height: 45.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        onPressed: () => onPressedLogin(context),
                        color: Themes.purpleDark,
                        textColor: Colors.white,
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ClickableTextUnderline(
                    textAlign: TextAlign.center,
                    data: "Create an Account!",
                    color: Themes.purpleDark,
                    onPressed: () {},
                  ),
                  ClickableTextUnderline(
                    textAlign: TextAlign.center,
                    data: "Forgot Your Password?",
                    color: Themes.purpleDark,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onPressedLogin(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    //var email = 'AS000002'; //emailCtrl.text.trim().toString();
    //var pwd = 'user01236'; //passwordCtrl.text.trim().toString();
    var email = emailCtrl.text.trim().toString();
    var pwd = passwordCtrl.text.trim().toString();
    if (email == null || email.length < 1) {
      showSnackBar(context, 'ID or Email can not be empty');
      return;
    }
    if (pwd == null || pwd.length < 1) {
      showSnackBar(context, 'Password can not be empty');
      return;
    }
    await pr.show();
    var authResponse = await authService.login(email, pwd);
    if (authResponse == null) {
      await pr.hide().then(
            (value) => showMessageDialog(
              context: context,
              title: 'Login failed',
              message: 'Something went wrong!',
            ),
          );
      passwordCtrl.clear();
      return;
    }

    var data = (authResponse['data'] as Map);
    if (data != null && data.containsKey('access_token')) {
      logDebug("login success");
      var token = data['access_token'];
      var user = {
        'username': email,
        'password': pwd,
        'token': token,
      };
      sharedPre.save('user', user);
      logDebug(user.toString());
      await pr.hide().then((value) => {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false,
            )
          });
    } else {
      var message = authResponse['message'];
      logDebug(message);
      await pr.hide().then(
        (value) {
          showMessageDialog(
            context: context,
            title: 'Login failed',
            message: 'Incorrect username or password',
          );
          passwordCtrl.clear();
        },
      );
    }
  }
}
