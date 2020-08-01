import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:twentyfour_hour/src/component/app_bar.dart';
import 'package:twentyfour_hour/src/component/gradient_panel.dart';
import 'package:twentyfour_hour/src/component/scaffold_safe_area.dart';
import 'package:twentyfour_hour/src/component/widget/circle.dart';
import 'package:twentyfour_hour/src/component/widget/horizontal_line.dart';
import 'package:twentyfour_hour/src/component/widget/label.dart';
import 'package:twentyfour_hour/src/component/widget/profile.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

import 'kyc_screen_prop.dart';

class KycVerifyScreen extends StatefulWidget {
  @override
  _KycVerifyScreenState createState() => _KycVerifyScreenState();
}

class _KycVerifyScreenState extends State<KycVerifyScreen> {
  KycScreenProp prop;

  @override
  void didChangeDependencies() {
    prop = ModalRoute.of(context).settings.arguments;
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
              alignment: Alignment.topCenter,
              children: <Widget>[
                GradientPanel(),
                Container(
                  margin: EdgeInsets.only(
                    top: percentHeight(context, 11.0),
                  ),
                  color: Themes.bg_gray,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Label(
                        Strings.VERIFY_YOUR_KYC,
                        marginTop: 35.0,
                        fontSize: 16.0,
                        color: Themes.purpleDark,
                      ),
                      _buildProcess(),
                      Label(
                        Strings.PROOF_OF_IDENTITY,
                        color: Themes.purple,
                        fontSize: 20.0,
                        marginTop: percentHeight(context, 2.0),
                        marginBottom: 10.0,
                      ),
                      Container(
                        width: percentWidth(context, 65.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      FontAwesome.globe,
                                      color: Colors.grey,
                                      size: 22.0,
                                    ),
                                    Label(
                                      prop.user.personal['country_code'] ??
                                          Strings.NA,
                                      paddingLeft: 5.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 30.0,
                                )
                              ],
                            ),
                            HorizontalLine(
                              color: Colors.black,
                              width: percentWidth(
                                context,
                                65.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Label(
                        Strings.CHOOSE_YOUR_ID_TYPE,
                        paddingLeft: 5.0,
                        color: Themes.purple,
                      ),
                    ],
                  ),
                ),
                Profile(
                  margin: EdgeInsets.only(
                    top: percentHeight(context, 5.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProcess() => Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildCircle(text: Strings.PROOF_OF_IDENTITY),
                HorizontalLine(
                  width: percentWidth(
                    context,
                    55.0,
                  ),
                ),
                _buildCircle(
                  text: Strings.SELFIES,
                  frontColor: Colors.grey,
                  fontColor: Colors.grey,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Label(
              Strings.PROOF_OF_IDENTITY,
              marginTop: percentHeight(context, 6.0),
              marginLeft: percentWidth(context, 10.0),
              color: Themes.purple,
              fontWeight: FontWeight.w600,
              fontSize: 12.0,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Label(
              Strings.SELFIES,
              marginTop: percentHeight(context, 6.0),
              marginRight: percentWidth(context, 14.0),
              color: Themes.purple,
              fontWeight: FontWeight.w600,
              fontSize: 12.0,
            ),
          ),
        ],
      );

  Widget _buildCircle({
    Color backColor = Colors.white,
    Color frontColor,
    Color fontColor,
    String text,
  }) =>
      Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Circle(
            color: backColor,
            width: 22.0,
            height: 22.0,
          ),
          Circle(
            color: frontColor ?? Themes.purple,
          ),
        ],
      );
}
