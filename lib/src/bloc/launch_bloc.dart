import 'package:flutter/src/widgets/framework.dart';
import 'package:twentyfour_hour/src/util/common_function.dart';
import 'package:twentyfour_hour/src/util/shared_pref.dart';

import 'base_bloc.dart';

class LaunchBloc extends BaseBloc {
  LaunchBloc(BuildContext context) : super(context);

  void isLogin() async {
    logInfo('Is user login');
    var isLogin = await sharedPre.containKey('user');
    add(isLogin);
    logInfo('$isLogin');
  }
}
