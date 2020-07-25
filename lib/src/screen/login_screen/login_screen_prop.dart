import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/bloc/base_prop.dart';
import 'package:twentyfour_hour/src/bloc/login_bloc.dart';
import 'package:twentyfour_hour/src/model/user.dart';

class LoginScreenProp extends BaseProp<LoginBloc> {
  final user = User();
  final formKey = GlobalKey<FormState>();
}
