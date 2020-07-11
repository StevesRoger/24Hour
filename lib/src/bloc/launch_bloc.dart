import 'package:flutter/src/widgets/framework.dart';
import 'package:twentyfour_hour/src/util/tools.dart';
import 'package:twentyfour_hour/src/util/shared_pref.dart';

import 'base_bloc.dart';

class LaunchBloc extends BaseBloc {

  void isLogin() async {
    logInfo('Is user login');
    var isLogin = await sharedPre.containKey('user');
    add(isLogin);
    logInfo('$isLogin');
  }
}
