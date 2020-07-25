import 'package:flutter/cupertino.dart';
import 'package:twentyfour_hour/src/model/item_select.dart';
import 'package:twentyfour_hour/src/screen/signup/signup_screen_prop.dart';
import 'package:twentyfour_hour/src/service/selection_service.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

import 'base_bloc.dart';

class SignUpBloc extends BaseBloc<SignUpScreenProp> {
  final selectionService = SelectionService();

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
    FocusScope.of(context).requestFocus(FocusNode());
    if (prop.formKey.currentState.validate()) {
      prop.formKey.currentState.save();
      await prop.progress.show();
    }
  }

  @override
  void dispose() {
    //streamCountry?.close();
  }
}
