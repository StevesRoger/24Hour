import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:provider/provider.dart';
import 'package:twentyfour_hour/src/bloc/change_password_bloc.dart';
import 'package:twentyfour_hour/src/component/app_bar.dart';
import 'package:twentyfour_hour/src/component/gradient_panel.dart';
import 'package:twentyfour_hour/src/component/scaffold_safe_area.dart';
import 'package:twentyfour_hour/src/component/widget/label.dart';
import 'package:twentyfour_hour/src/component/widget/round_button.dart';
import 'package:twentyfour_hour/src/component/widget/round_text_form_field.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

import 'change_password_prop.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final prop = ChangePasswordProp();

  @override
  void didChangeDependencies() {
    prop.init(Provider.of<ChangePasswordBloc>(context), context);
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
                    K.IMAGE_PATH + 'icons/password-white.png',
                    height: 70,
                    fit: BoxFit.scaleDown,
                  ),
                  Label(
                    Strings.CHANGE_PASSWORD,
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
                        hint: Strings.CURRENT_PASSWORD,
                        validator: (val) => val == null || val.isEmpty
                            ? Strings.EMPTY_CURRENT_PASSWORD
                            : null,
                        onSaved: (val) => prop.user.password = val,
                      ),
                      RoundTextFormField.textLeft(
                        hint: Strings.NEW_PASSWORD,
                        validator: (val) => val == null || val.isEmpty
                            ? Strings.EMPTY_NEW_PASSWORD
                            : null,
                        onSaved: (val) => prop.user.newPassword = val,
                      ),
                      RoundTextFormField.textLeft(
                        hint: Strings.CONFIRM_PASSWORD,
                        validator: (val) => val == null || val.isEmpty
                            ? Strings.EMPTY_CONFIRM_PASSWORD
                            : null,
                        onSaved: (val) => prop.user.confirmPassword = val,
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
