import 'package:twentyfour_hour/src/model/user.dart';

import '../service/user_profile_service.dart';
import '../util/shared_pref.dart';
import '../util/tools.dart';
import 'base_bloc.dart';

class HomeBloc extends BaseBloc {
  final userService = UserProfileService();

  void fetchUserInfo() async {
    try {
      var map = await sharedPre.read('user') ?? Map();
      var user = User.login(map['username'], map['token']);
      var response = await userService.getUserWallet(user.token);
      if (response.isSucceed()) user.walletFromMap(response.getData());
      add(user);
    } catch (ex) {
      logError(ex.toString());
      add(User());
    }
  }
}
