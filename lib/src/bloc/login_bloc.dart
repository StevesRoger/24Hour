import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/model/response_entity.dart';
import 'package:twentyfour_hour/src/model/user.dart';
import 'package:twentyfour_hour/src/screen/login_screen/login_screen_prop.dart';
import 'package:twentyfour_hour/src/service/authentication_service.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/shared_pref.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

import 'base_bloc.dart';

class LoginBloc extends BaseBloc<LoginScreenProp> {
  final authService = AuthenticationService();

  LoginBloc(BuildContext context) : super(context);

  void onPressedLogin() async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (prop.formKey.currentState.validate()) {
      prop.formKey.currentState.save();
      await prop.progress.show();
      //var response = await _login(prop.user.username, prop.user.password);
      var response = await _login('AS000002', 'user01236');
      await prop.progress.hide().then(
        (value) {
          if (response.isSucceed()) {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.HOME, (route) => false);
            //Navigator.pushNamed(context, Routes.HOME);
          } else {
            showMessageDialog(
              context: context,
              title: Strings.LOGIN_FAILED,
              message: Strings.INCORRECT_USR_PWD,
            );
            logInfo(response.message);
          }
        },
      );
    }
  }

  Future<ResponseEntity> _login(String username, String password) async {
    try {
      var response = await authService.login(username, password);
      if (response.isSucceed()) {
        logInfo('login success');
        var data = response.getData();
        var token = data['access_token'];
        if (token == null)
          return ResponseEntity.errorWithMessage(Strings.MISSING_ACCESS_TOKEN);
        var user = User.fromUsernameToken(username, token);
        logInfo('save user login');
        logInfo(user.toString());
        await sharedPre.save('user', {'username': username, 'token': token});
      }
      return response;
    } catch (ex) {
      logError(ex.toString());
      return ResponseEntity.error();
    }
  }

  @override
  void dispose() {}
}
