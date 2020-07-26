import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/component/app_bar.dart';
import 'package:twentyfour_hour/src/component/gradient_panel.dart';
import 'package:twentyfour_hour/src/component/profile.dart';
import 'package:twentyfour_hour/src/component/round_rectangle.dart';
import 'package:twentyfour_hour/src/component/scaffold_safe_area.dart';
import 'package:twentyfour_hour/src/component/widget/label.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

import 'kyc_screen_builder.dart';

class KycScreen extends StatefulWidget {
  @override
  _KycScreenState createState() => _KycScreenState();
}

class _KycScreenState extends State<KycScreen> {
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
                      KycScreenBuilder.buildButtonVerifyKyc(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Label(
                            Strings.PERSONAL_INFO,
                            color: Themes.purpleDark,
                            marginBottom: 5.0,
                          ),
                          Rectangle(
                            paddingLeft: 10.0,
                            color: Colors.white,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.people,
                                  color: Colors.grey,
                                ),
                                Label(
                                  'Male',
                                  paddingLeft: 10.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                            height: 35.0,
                            radius: 5.0,
                            width: percentWidth(
                              context,
                              85.0,
                            ),
                            border: Border.all(color: Colors.grey),
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
}
