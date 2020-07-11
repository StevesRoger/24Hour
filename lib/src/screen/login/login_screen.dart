import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:twentyfour_hour/src/bloc/login_bloc.dart';
import 'package:twentyfour_hour/src/component/widget/clickable_text.dart';
import 'package:twentyfour_hour/src/component/widget/round_button.dart';
import 'package:twentyfour_hour/src/component/widget/round_text_field.dart';
import 'package:twentyfour_hour/src/model/response_entity.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  ProgressDialog _progress;
  LoginBloc _bloc;

  @override
  void didChangeDependencies() {
    _bloc = Provider.of<LoginBloc>(context);
    _progress = ProgressDialog(context, isDismissible: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Themes.gray,
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
                    Strings.MEMBER_LOGIN,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Themes.purpleDark,
                      fontWeight: FontWeight.w800,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                _buildTextField(
                  Strings.EMAIL,
                  _emailCtrl,
                  TextInputType.emailAddress,
                ),
                _buildTextField(
                  Strings.PASSWORD,
                  _passwordCtrl,
                  TextInputType.text,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25.0,
                    left: 45.0,
                    right: 45.0,
                  ),
                  child: RoundButton(
                    color: Themes.purpleDark,
                    label: Strings.LOGIN,
                    onPressed: _onPressedLogin,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ClickableTextUnderline(
                  textAlign: TextAlign.center,
                  data: Strings.CREATE_ACCOUNT,
                  color: Themes.purpleDark,
                  onPressed: () {},
                ),
                ClickableTextUnderline(
                  textAlign: TextAlign.center,
                  data: Strings.FORGOT_PASSWORD,
                  color: Themes.purpleDark,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String hint, TextEditingController controller, TextInputType inputType) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 40.0,
        right: 40.0,
      ),
      child: RoundTextField(
        hint: hint,
        controller: controller,
        inputType: inputType,
      ),
    );
  }

  void _onPressedLogin() async {
    FocusScope.of(context).requestFocus(FocusNode());
    var email = 'AS000002';
    var pwd = 'user01236';
    //var email = _emailCtrl.text.trim().toString();
    //var pwd = _passwordCtrl.text.trim().toString();
    if (email == null || email.isEmpty) {
      showSnackBar(context, Strings.EMPTY_EMAIL);
      return;
    }
    if (pwd == null || pwd.isEmpty) {
      showSnackBar(context, Strings.EMPTY_PASSWORD);
      return;
    }
    await _progress.show();
    var response = await _bloc?.login(email, pwd) ?? ResponseEntity.error();
    await _progress.hide().then(
      (value) {
        if (response.isSucceed()) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.HOME, (route) => false);
        } else {
          showMessageDialog(
            context: context,
            title: Strings.LOGIN_FAILED,
            message: response.message ?? Strings.INCORRECT_USR_PWD,
          );
          _passwordCtrl.clear();
          logDebug(response.message);
        }
      },
    );
  }
}
