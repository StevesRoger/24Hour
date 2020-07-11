import 'package:flutter/src/widgets/framework.dart';
import 'package:twentyfour_hour/src/model/response_entity.dart';
import 'package:twentyfour_hour/src/service/authentication_service.dart';
import 'package:twentyfour_hour/src/util/common_function.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/shared_pref.dart';

import 'base_bloc.dart';

class LoginBloc extends BaseBloc {
  final authService = AuthenticationService();

  LoginBloc(BuildContext context) : super(context);

  Future<ResponseEntity> login(String username, String password) async {
    ResponseEntity resp;
    try {
      resp = await authService.login(username, password);
      if (resp.isSucceed()) {
        logDebug("login success");
        var data = resp.getData();
        var token = data['access_token'];
        if (token == null)
          return ResponseEntity.errorWithMessage(Strings.MISSING_ACCESS_TOKEN);
        var user = {
          'username': username,
          'password': password,
          'token': token,
        };
        logDebug(user.toString());
        await sharedPre.save('user', user);
        add(resp);
      }
      return resp ?? ResponseEntity.error();
    } catch (ex) {
      logError(ex.toString());
      add(ResponseEntity.error());
      return ResponseEntity.error();
    }
  }
}
