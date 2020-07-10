import 'package:twentyfour_hour/src/service/authentication_service.dart';
import 'package:twentyfour_hour/src/util/common_function.dart';
import 'package:twentyfour_hour/src/util/shared_pref.dart';

import 'base_bloc.dart';

class LoginBloc extends BaseBloc {
  final authService = AuthenticationService();

  void login(String username, String password) async {
    try {
      var resp = await authService.login(username, password);
      if (resp.containsKey('data')) {
        logDebug("login success");
        var data = resp['data'] as Map;
        var token = data['access_token'];
        var user = {
          'username': username,
          'password': password,
          'token': token,
        };
        logDebug(user.toString());
        await sharedPre.save('user', user);
        add(true);
      }
    } on Exception catch (ex) {
      logInfo(ex.toString());
      add(false);
    }
  }
}
