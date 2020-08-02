import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twentyfour_hour/src/bloc/usdt_bloc.dart';
import 'package:twentyfour_hour/src/component/app_bar.dart';
import 'package:twentyfour_hour/src/component/gradient_panel.dart';
import 'package:twentyfour_hour/src/component/scaffold_safe_area.dart';
import 'package:twentyfour_hour/src/component/widget/label.dart';
import 'package:twentyfour_hour/src/component/widget/round_button.dart';
import 'package:twentyfour_hour/src/component/widget/round_text_form_field.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

import 'usdt_prop.dart';

class USDTScreen extends StatefulWidget {
  @override
  _USDTScreenState createState() => _USDTScreenState();
}

class _USDTScreenState extends State<USDTScreen> {
  final prop = USDTProp();

  @override
  void didChangeDependencies() {
    prop.init(Provider.of<USDTBloc>(context), context);
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
                    K.IMAGE_PATH + 'icons/usdt.png',
                    height: 70,
                    fit: BoxFit.scaleDown,
                  ),
                  Label(
                    Strings.USDT,
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
                        hint: Strings.WALLET_ADDRESS,
                        validator: (val) => val == null || val.isEmpty
                            ? Strings.EMPTY_WALLET_ADDRESS
                            : null,
                        //onSaved: (val) => prop.user.pin = val,
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
