import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twentyfour_hour/src/bloc/login_bloc.dart';
import 'package:twentyfour_hour/src/component/scaffold_safe_area.dart';
import 'package:twentyfour_hour/src/component/widget/clickable_text.dart';
import 'package:twentyfour_hour/src/component/widget/logo_image.dart';
import 'package:twentyfour_hour/src/component/widget/round_button.dart';
import 'package:twentyfour_hour/src/component/widget/round_text_form_field.dart';
import 'package:twentyfour_hour/src/component/widget/text_title.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

import 'login_prop.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final prop = LoginScreenProp();

  @override
  void didChangeDependencies() {
    prop.init(Provider.of<LoginBloc>(context), context);
    prop.progress.style(message: Strings.PROCESSING);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldSafeArea(
      backgroundColor: Themes.bg_gray,
      body: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          LogoImage(),
          TextTitle(
            Strings.MEMBER_LOGIN,
          ),
          Form(
            key: prop.formKey,
            child: Column(
              children: <Widget>[
                RoundTextFormField(
                  onSaved: (val) => prop.user.username = val,
                  hint: Strings.ID_OR_EMAIL,
                  inputType: TextInputType.emailAddress,
                  validator: (val) => val == null || val.isEmpty
                      ? Strings.EMPTY_ID_EMAIL
                      : null,
                ),
                RoundTextFormField(
                  hint: Strings.PASSWORD,
                  onSaved: (val) => prop.user.password = val,
                  obscureText: true,
                  validator: (val) => val == null || val.isEmpty
                      ? Strings.EMPTY_PASSWORD
                      : null,
                ),
              ],
            ),
          ),
          RoundButton(
            marginTop: 10.0,
            color: Themes.purpleDark,
            label: Strings.LOGIN,
            onPressed: () => prop.bloc.onPressedLogin(),
          ),
          ClickableTextUnderline(
            marginTop: 10.0,
            data: Strings.CREATE_ACCOUNT,
            onPressed: () => Navigator.pushNamed(context, Routes.SIGN_UP),
          ),
          ClickableTextUnderline(
            data: Strings.FORGOT_PASSWORD,
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
