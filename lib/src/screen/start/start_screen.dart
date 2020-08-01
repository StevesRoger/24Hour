import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/component/widget/logo_image.dart';
import 'package:twentyfour_hour/src/component/scaffold_safe_area.dart';
import 'package:twentyfour_hour/src/component/widget/round_button.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldSafeArea(
      color: Themes.bg_gray,
      body: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          LogoImage(),
          RoundButton(
            marginBottom: 20.0,
            color: Themes.purpleDark,
            label: Strings.SIGN_UP,
            onPressed: () => Navigator.pushNamed(context, Routes.SIGN_UP),
          ),
          RoundButton(
            color: Themes.pinkColor,
            label: Strings.LOGIN,
            onPressed: () => Navigator.pushNamed(context, Routes.LOGIN),
          ),
        ],
      ),
    );
  }
}
