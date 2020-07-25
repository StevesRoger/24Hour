
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twentyfour_hour/src/util/shared_pref.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

import 'base_bloc.dart';

class LaunchBloc extends BaseBloc {
  final userStream = BehaviorSubject<bool>();

  LaunchBloc(BuildContext context) : super(context);

  void isLogin() async {
    try {
      logInfo('Is user login');
      var isLogin = await sharedPre.containKey('user');
      userStream.add(isLogin);
      logInfo('$isLogin');
    } catch (ex) {
      logError(ex.toString());
      userStream.add(false);
    }
  }

  @override
  void dispose() {
    userStream?.close();
  }
}
