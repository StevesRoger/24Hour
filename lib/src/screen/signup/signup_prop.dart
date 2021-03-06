import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/bloc/base_prop.dart';
import 'package:twentyfour_hour/src/bloc/signup_bloc.dart';
import 'package:twentyfour_hour/src/model/user_register.dart';

class SignUpScreenProp extends BaseProp<SignUpBloc> {
  final userRegister = UserRegister();
  final passwordCtrl = TextEditingController();
  final refferalId = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    refferalId?.dispose();
    passwordCtrl?.dispose();
  }
}
