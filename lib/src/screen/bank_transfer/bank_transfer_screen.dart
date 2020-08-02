import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twentyfour_hour/src/bloc/bank_transfer_bloc.dart';
import 'package:twentyfour_hour/src/component/app_bar.dart';
import 'package:twentyfour_hour/src/component/gradient_panel.dart';
import 'package:twentyfour_hour/src/component/scaffold_safe_area.dart';
import 'package:twentyfour_hour/src/component/widget/label.dart';
import 'package:twentyfour_hour/src/component/widget/round_button.dart';
import 'package:twentyfour_hour/src/component/widget/round_text_form_field.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

import 'bank_transfer_prop.dart';

class BankTransferScreen extends StatefulWidget {
  @override
  _BankTransferScreenState createState() => _BankTransferScreenState();
}

class _BankTransferScreenState extends State<BankTransferScreen> {
  final prop = BankTransferProp();

  @override
  void didChangeDependencies() {
    prop.init(Provider.of<BankTransferBloc>(context), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldSafeArea(
      backgroundColor: Themes.bg_gray,
      resizeToAvoidBottomPadding: false,
      alignment: Alignment.topCenter,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AsAppBar(),
            GradientPanel(
              height: 20.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    K.IMAGE_PATH + 'icons/bank-white.png',
                    height: 70,
                    fit: BoxFit.scaleDown,
                  ),
                  Label(
                    Strings.BANK_TRANSFER,
                    marginTop: 10.0,
                  ),
                ],
              ),
              end: 1.0,
            ),
            ListView(
              padding: EdgeInsets.only(top: 20.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                Form(
                  child: Column(
                    children: <Widget>[
                      RoundTextFormField.textLeft(
                        hint: Strings.BANK_NAME,
                        validator: (val) => val == null || val.isEmpty
                            ? Strings.EMPTY_BANK_NAME
                            : null,
                        //onSaved: (val) => prop.user.password = val,
                      ),
                      RoundTextFormField.textLeft(
                        hint: Strings.ACCOUNT_NAME,
                        validator: (val) => val == null || val.isEmpty
                            ? Strings.EMPTY_ACCOUNT_NAME
                            : null,
                        //onSaved: (val) => prop.user.newPassword = val,
                      ),
                      RoundTextFormField.textLeft(
                        hint: Strings.ACCOUNT_NUMBER,
                        validator: (val) => val == null || val.isEmpty
                            ? Strings.EMPTY_ACCOUNT_NUMBER
                            : null,
                        //onSaved: (val) => prop.user.confirmPassword = val,
                      ),
                      RoundTextFormField.textLeft(
                        hint: Strings.COUNTRY,
                        validator: (val) => val == null || val.isEmpty
                            ? Strings.EMPTY_COUNTRY
                            : null,
                        //onSaved: (val) => prop.user.confirmPassword = val,
                      ),
                      RoundButton(
                        marginTop: 20.0,
                        marginBottom: 10.0,
                        width: percentWidth(context, 65.0),
                        color: Themes.purpleDark,
                        label: Strings.CONFIRM,
                        onPressed: prop.bloc.onConfirm,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
