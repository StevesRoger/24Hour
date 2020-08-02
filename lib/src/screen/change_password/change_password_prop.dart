import 'package:twentyfour_hour/src/bloc/base_prop.dart';
import 'package:twentyfour_hour/src/bloc/change_password_bloc.dart';
import 'package:twentyfour_hour/src/model/user.dart';

class ChangePasswordProp extends BaseProp<ChangePasswordBloc> {
  User user;

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
