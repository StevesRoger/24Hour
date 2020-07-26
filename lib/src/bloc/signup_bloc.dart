import 'package:flutter/cupertino.dart';
import 'package:twentyfour_hour/src/model/item_select.dart';
import 'package:twentyfour_hour/src/screen/signup/signup_screen_prop.dart';
import 'package:twentyfour_hour/src/service/authentication_service.dart';
import 'package:twentyfour_hour/src/service/selection_service.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/shared_pref.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

import 'base_bloc.dart';

class SignUpBloc extends BaseBloc<SignUpScreenProp> {
  final selectionService = SelectionService();
  final authService = AuthenticationService();

  SignUpBloc(BuildContext context) : super(context);

  Future<List<ItemSelect>> listCountry() async {
    var countries = List<ItemSelect>();
    try {
      var response = await selectionService.listCountry();
      if (response.isSucceed()) {
        logInfo('list country success');
        var data = response.getData();
        data.forEach((key, value) {
          var item = value as Map;
          var country = ItemSelect(item['name'], value: item['code']);
          country.json = item;
          countries.add(country);
        });
      }
      return countries;
    } catch (ex) {
      logError(ex.toString());
      return countries;
    }
  }

  void onPressedSubmit() async {
    try {
      FocusScope.of(context).requestFocus(FocusNode());
      if (prop.formKey.currentState.validate()) {
        logInfo('register user');
        prop.formKey.currentState.save();
        await prop.progress.show();
        var response = await authService.register(prop.userRegister.toMap());
        var data = response.getData();
        var token = data['access_token'];
        if (token == null) throw Exception(Strings.REGISTER_FAILED);
        prop.userRegister.toMap().remove('password');
        prop.userRegister.toMap().remove('confirm_password');
        await sharedPre.save('user', {
          'username': prop.userRegister.userName(),
          'token': token,
          'info': prop.userRegister.toMap()
        });
        await prop.progress.hide().then(
          (value) {
            if (response.isSucceed()) {
              logInfo('register successful');
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.HOME, (route) => false);
            } else {
              showMessageDialog(
                context: context,
                title: Strings.REGISTER_FAILED,
                message: response.message,
              );
              logInfo(response.message);
            }
          },
        );
      }
    } catch (ex) {
      logError(ex.toString());
      await prop.progress.hide().then(
            (value) => {
              showMessageDialog(
                context: context,
                title: Strings.REGISTER_FAILED,
                message: ex.toString(),
              )
            },
          );
    }
  }

  @override
  void dispose() {
    //streamCountry?.close();
  }
}
