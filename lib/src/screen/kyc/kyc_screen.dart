import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:twentyfour_hour/src/component/app_bar.dart';
import 'package:twentyfour_hour/src/component/gradient_panel.dart';
import 'package:twentyfour_hour/src/component/profile.dart';
import 'package:twentyfour_hour/src/component/round_rectangle.dart';
import 'package:twentyfour_hour/src/component/scaffold_safe_area.dart';
import 'package:twentyfour_hour/src/component/widget/label.dart';
import 'package:twentyfour_hour/src/model/user.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

import 'kyc_screen_prop.dart';

class KycScreen extends StatefulWidget {
  @override
  _KycScreenState createState() => _KycScreenState();
}

class _KycScreenState extends State<KycScreen> {
  final prop = KycScreenProp();

  @override
  void didChangeDependencies() {
    prop.init(context);
    prop.user = ModalRoute.of<User>(context).settings.arguments;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldSafeArea(
      backgroundColor: Themes.purpleDark,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AsAppBar(),
            Stack(
              children: <Widget>[
                GradientPanel(),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    top: percentHeight(context, 11.0),
                  ),
                  color: Colors.grey,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Label(
                        'Username',
                        marginTop: 32.0,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Themes.purpleDark,
                      ),
                      Label(
                        'Username',
                        fontSize: 16.0,
                        color: Themes.purpleDark,
                      ),
                      _buildButtonVerifyKyc(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Label(
                            Strings.PERSONAL_INFO,
                            color: Themes.purpleDark,
                            marginBottom: 5.0,
                          ),
                          _buildRectangle(prop.user.personal['sex'],
                              icon: Icons.people),
                          _buildRectangle(prop.user.personal['country_code'],
                              icon: FontAwesome.globe),
                          _buildRectangle(prop.user.personal['email'],
                              icon: Icons.email),
                          _buildRectangle(prop.user.personal['phone'],
                              icon: Icons.phone_iphone),
                          _buildRectangle(prop.user.personal['ref_id'],
                              icon: Icons.portrait),
                          Label(
                            Strings.WITHDRAWAL_ACCOUNT,
                            color: Themes.purpleDark,
                            marginLeft: 5.0,
                            marginTop: 5.0,
                            marginBottom: 5.0,
                          ),
                          _buildRectangle(
                            Strings.BANK_TRANSFER,
                            icon: FontAwesome.bank,
                            paddingLeft: 15.0,
                            textColor: Themes.purple,
                            width: 100.0,
                            radius: 0.0,
                            border: Border(bottom: BorderSide()),
                          ),
                          _buildRectangle(
                            Strings.USDT,
                            icon: FontAwesome.bank,
                            paddingLeft: 15.0,
                            textColor: Themes.purple,
                            width: 100.0,
                            radius: 0.0,
                            border: Border(bottom: BorderSide()),
                          ),
                          Label(
                            Strings.WITHDRAWAL_ACCOUNT,
                            color: Themes.purpleDark,
                            marginLeft: 5.0,
                            marginTop: 5.0,
                            marginBottom: 5.0,
                          ),
                          _buildRectangle(
                            Strings.CHANGE_PASSWORD,
                            icon: FontAwesome.bank,
                            paddingLeft: 15.0,
                            textColor: Themes.purple,
                            width: 100.0,
                            radius: 0.0,
                            border: Border(bottom: BorderSide()),
                          ),
                          _buildRectangle(
                            Strings.SET_PIN,
                            icon: FontAwesome.bank,
                            paddingLeft: 15.0,
                            textColor: Themes.purple,
                            width: 100.0,
                            radius: 0.0,
                            border: Border(bottom: BorderSide()),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Profile(
                    margin: EdgeInsets.only(
                      top: percentHeight(context, 5.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonVerifyKyc() => RoundRectangle(
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

  Widget _buildRectangle(
    String label, {
    Widget widget,
    IconData icon,
    double paddingLeft: 10.0,
    double textPaddingLeft = 10.0,
    double width = 85.0,
    double radius = 5.0,
    Color iconColor = Colors.grey,
    Color textColor = Colors.grey,
    Border border,
  }) =>
      RoundRectangle(
        paddingLeft: paddingLeft,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            icon != null
                ? Icon(
                    icon,
                    color: iconColor,
                  )
                : widget,
            Label(
              label ?? 'N/A',
              paddingLeft: textPaddingLeft,
              color: textColor,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
        height: 35.0,
        radius: radius,
        width: percentWidth(
          context,
          width,
        ),
        border: border ?? Border.all(color: Colors.grey),
      );
}
