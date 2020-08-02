import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/screen/login_screen/login_prop.dart';
import 'package:twentyfour_hour/src/service/authentication_service.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/shared_pref.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

import 'base_bloc.dart';

class LoginBloc extends BaseBloc<LoginScreenProp> {
  final authService = AuthenticationService();

  LoginBloc(BuildContext context) : super(context);

  void onPressedLogin() async {
    try {
      FocusScope.of(context).requestFocus(FocusNode());
      if (prop.formKey.currentState.validate()) {
        prop.formKey.currentState.save();
        prop.user.username = 'AS000002';
        prop.user.password = 'user01236';
        await prop.progress.show();
        var response =
            await authService.login(prop.user.username, prop.user.password);
        var data = response.getData();
        var token = data['access_token'];
        if (token == null) throw Exception(Strings.GET_ACCESS_TOKEN_FAIL);
        await sharedPre
            .save('user', {'username': prop.user.username, 'token': token});
        await prop.progress.hide().then((value) {
          if (response.isSucceed()) {
            logInfo('login success');
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.HOME, (route) => false);
          } else {
            showMessageDialog(
              context: context,
              title: Strings.LOGIN_FAILED,
              message: Strings.INCORRECT_USR_PWD,
            );
            logInfo(response.message);
          }
        });
      }
    } catch (ex) {
      logError(ex.toString());
      await prop.progress.hide().then(
            (value) => {
              showMessageDialog(
                context: context,
                title: Strings.LOGIN_FAILED,
                message: ex.toString(),
              )
            },
          );
    }
  }

  @override
  void dispose() {
    prop?.dispose();
  }
}
