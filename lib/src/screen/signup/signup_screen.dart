import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:provider/provider.dart';
import 'package:twentyfour_hour/src/bloc/signup_bloc.dart';
import 'package:twentyfour_hour/src/component/gradient_panel.dart';
import 'package:twentyfour_hour/src/component/loading_panel.dart';
import 'package:twentyfour_hour/src/component/widget/logo_image.dart';
import 'package:twentyfour_hour/src/component/scaffold_safe_area.dart';
import 'package:twentyfour_hour/src/component/widget/text_title.dart';
import 'package:twentyfour_hour/src/component/widget/clickable_text.dart';
import 'package:twentyfour_hour/src/component/widget/label.dart';
import 'package:twentyfour_hour/src/component/widget/round_button.dart';
import 'package:twentyfour_hour/src/component/widget/round_select_form_field.dart';
import 'package:twentyfour_hour/src/component/widget/round_text_form_field.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

import 'signup_screen_prop.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final prop = SignUpScreenProp();

  @override
  void didChangeDependencies() {
    prop.init(Provider.of<SignUpBloc>(context), context);
    prop.progress.style(message: Strings.PROCESSING);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldSafeArea(
      color: Themes.bg_gray,
      body: StreamBuilder<bool>(
        initialData: false,
        stream: prop.bloc.refferalStream,
        builder: (_, snap) {
          return LoadingPanel(
            isLoading: snap.data,
            color: Colors.black,
            child: ListView(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
              ),
              shrinkWrap: true,
              children: <Widget>[
                LogoImage(),
                TextTitle(Strings.REGISTER),
                Form(
                  key: prop.formKey,
                  child: Column(
                    children: <Widget>[
                      RoundTextFormField(
                        prefixIcon: Icon(Icons.person),
                        hint: Strings.LAST_NAME,
                        validator: (val) => val == null || val.isEmpty
                            ? Strings.EMPTY_LAST_NAME
                            : null,
                        onSaved: (val) => prop.userRegister.lastName = val,
                      ),
                      RoundTextFormField(
                        prefixIcon: Icon(Icons.person),
                        hint: Strings.FIRST_NAME,
                        validator: (val) => val == null || val.isEmpty
                            ? Strings.EMPTY_FIRST_NAME
                            : null,
                        onSaved: (val) => prop.userRegister.firstName = val,
                      ),
                      RoundSelectFormField(
                        prefixIcon: Icon(Icons.people),
                        hint: Strings.SEX,
                        percentPadding: 18.0,
                        items: K.sex,
                        validator: (val) => val == null || val.label.isEmpty
                            ? Strings.EMPTY_SEX
                            : null,
                        onSaved: (val) => prop.userRegister.sex = val.label,
                      ),
                      RoundSelectFormField(
                        prefixIcon: Icon(FontAwesome.globe),
                        hint: Strings.COUNTRY,
                        items: K.countries,
                        validator: (val) => val == null ||
                                val.label.isEmpty ||
                                val.value == null
                            ? Strings.EMPTY_COUNTRY
                            : null,
                        onSaved: (val) => prop.userRegister.country = val,
                      ),
                      RoundTextFormField(
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                        hint: Strings.EMAIL,
                        inputType: TextInputType.emailAddress,
                        validator: (val) => val == null || val.isEmpty
                            ? Strings.EMPTY_EMAIL
                            : null,
                        onSaved: (val) => prop.userRegister.email = val,
                      ),
                      RoundTextFormField(
                        prefixIcon: Icon(
                          Icons.phone_iphone,
                        ),
                        hint: Strings.PHONE,
                        inputType: TextInputType.number,
                        validator: (val) => val == null || val.isEmpty
                            ? Strings.EMPTY_PHONE
                            : null,
                        onSaved: (val) => prop.userRegister.phone = val,
                      ),
                      RoundTextFormField(
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                        hint: Strings.PASSWORD,
                        controller: prop.passwordCtrl,
                        obscureText: true,
                        validator: (val) => val == null || val.isEmpty
                            ? Strings.EMPTY_PASSWORD
                            : null,
                        onSaved: (val) => prop.userRegister.password = val,
                      ),
                      RoundTextFormField(
                        prefixIcon: Icon(
                          Icons.loop,
                        ),
                        hint: Strings.CONFIRM_PASSWORD,
                        obscureText: true,
                        validator: (val) {
                          if (val == null || val.isEmpty)
                            return Strings.EMPTY_CONFIRM_PASSWORD;
                          if (val != prop.passwordCtrl.text)
                            return Strings.CONFIRM_MISMATCH_PASSWORD;
                          return null;
                        },
                        onSaved: (val) =>
                            prop.userRegister.confirmPassword = val,
                      ),
                      RoundTextFormField(
                        controller: prop.refferalId,
                        suffixIcon: GestureDetector(
                          onTap: () => prop.bloc.onPressedDefaultId(),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: GradientPanel(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Themes.purple, Themes.purpleDark],
                                stops: [0.0, 0.7],
                              ),
                              width: 80,
                              height: 0.0,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              child: Label(
                                Strings.DEFAULT_ID,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        prefixIcon: Icon(Icons.portrait),
                        hint: Strings.REFFERAL_ID,
                        validator: (val) => val == null || val.isEmpty
                            ? Strings.EMPTY_REFFERAL_ID
                            : null,
                        onSaved: (val) => prop.userRegister.refferalId = val,
                      ),
                    ],
                  ),
                ),
                RoundButton(
                  marginTop: 10.0,
                  color: Themes.purpleDark,
                  label: Strings.SUBMIT,
                  onPressed: () => prop.bloc.onPressedSubmit(),
                ),
                ClickableTextUnderline(
                  marginTop: 10.0,
                  marginBottom: 5.0,
                  data: Strings.BACK_TO_LOGIN,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  Strings.COPY_RIGHT,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black26,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
