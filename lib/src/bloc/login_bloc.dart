import 'package:twentyfour_hour/src/model/response_entity.dart';
import 'package:twentyfour_hour/src/model/user.dart';
import 'package:twentyfour_hour/src/service/authentication_service.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/shared_pref.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

import 'base_bloc.dart';

class LoginBloc extends BaseBloc {
  final authService = AuthenticationService();

  Future<ResponseEntity> login(String username, String password) async {
    try {
      var response = await authService.login(username, password);
      if (response.isSucceed()) {
        logDebug("login success");
        var data = response.getData();
        var token = data['access_token'];
        if (token == null)
          return ResponseEntity.errorWithMessage(Strings.MISSING_ACCESS_TOKEN);
        var user = User.login(username, token);
        logDebug("save user login");
        logDebug(user.toString());
        await sharedPre.save('user', {'username': username, 'token': token});
      }
      return response ?? ResponseEntity.error();
    } catch (ex) {
      logError(ex.toString());
      return ResponseEntity.error();
    }
  }
}
