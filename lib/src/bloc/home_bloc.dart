
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twentyfour_hour/src/model/user.dart';

import '../service/user_profile_service.dart';
import '../util/shared_pref.dart';
import '../util/tools.dart';
import 'base_bloc.dart';

class HomeBloc extends BaseBloc {
  final userService = UserProfileService();
  final userStream = BehaviorSubject<User>();

  HomeBloc(BuildContext context) : super(context);

  void fetchUserInfo() async {
    User user;
    try {
      var map = await sharedPre.read('user') ?? Map();
      user = User.fromUsernameToken(map['username'], map['token']);
      var response = await userService.getUserWallet(user.token);
      if (response.isSucceed()) user.infoFromMap(response.getData());
      userStream.add(user);
    } catch (ex) {
      logError(ex.toString());
      userStream.add(user ?? User());
    }
  }

  @override
  void dispose() {
    userStream?.close();
  }
}
