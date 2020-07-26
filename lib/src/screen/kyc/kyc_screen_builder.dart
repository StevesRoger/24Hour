import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/component/round_rectangle.dart';
import 'package:twentyfour_hour/src/component/widget/label.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

class KycScreenBuilder {
  static Widget buildButtonVerifyKyc() {
    return Rectangle(
      marginTop: 2.0,
      radius: 20.0,
      child: Row(
        children: <Widget>[
          Label(
            Strings.VERIFY_KYC,
            fontSize: 12.0,
            fontWeight: FontWeight.w700,
            marginLeft: 12.0,
          ),
          Expanded(
            child: Icon(
              Icons.arrow_forward,
              size: 15.0,
              color: Colors.white,
            ),
          )
        ],
      ),
      width: 100.0,
      height: 18.0,
      color: Themes.purpleDark,
    );
  }

  static buildProfile() {}
}
