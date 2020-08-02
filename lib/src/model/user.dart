import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

import 'base_entity.dart';

class User extends BaseEntity {
  String username = Strings.NA;
  String password = '';
  String newPassword = '';
  String confirmPassword = '';
  String pin = '';
  String newPin = '';
  String confirmPin = '';
  String token = '';
  dynamic total = 0.0;
  dynamic deposit = 0.0;
  dynamic cash = 0.0;
  dynamic registerPoint = 0.0;
  dynamic availableEarning = 0.0;
  String package = Strings.NA;
  Map personal = Map();
  Image image;
  bool kycStatus = false;
  bool hasPin = false;

  User();

  User.fromUsernameToken(this.username, this.token);

  void walletFromMap(Map data) {
    total = data['balance'] ?? 0.0;
    deposit = data['deposit'] ?? 0.0;
    cash = data['cash_balance'] ?? 0.0;
    registerPoint = data['register_point'] ?? 0.0;
    var activePackage = data['active_package'];
    if (activePackage != null) {
      package = activePackage['name'] ?? Strings.NA;
      availableEarning = activePackage['available'] ?? 0.0;
    }
  }

  bool isValid() {
    return token != null && token.isNotEmpty;
  }

  @override
  String toString() {
    return 'User{username: $username, token: $token}';
  }
}
