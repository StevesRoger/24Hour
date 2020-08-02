import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/component/app_bar.dart';
import 'package:twentyfour_hour/src/component/gradient_panel.dart';
import 'package:twentyfour_hour/src/component/scaffold_safe_area.dart';
import 'package:twentyfour_hour/src/component/widget/circle.dart';
import 'package:twentyfour_hour/src/component/widget/horizontal_line.dart';
import 'package:twentyfour_hour/src/component/widget/label.dart';
import 'package:twentyfour_hour/src/component/widget/profile.dart';
import 'package:twentyfour_hour/src/component/widget/round_button.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

import 'profile_prop.dart';

class SelfiesVerifyScreen extends StatefulWidget {
  @override
  _SelfiesVerifyScreenState createState() => _SelfiesVerifyScreenState();
}

class _SelfiesVerifyScreenState extends State<SelfiesVerifyScreen> {
  ProfileScreenProp prop;

  @override
  void didChangeDependencies() {
    prop = ModalRoute.of(context).settings.arguments;
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
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                GradientPanel(),
                Container(
                  color: Themes.bg_gray,
                  width: percentWidth(context, 100.0),
                  margin: EdgeInsets.only(
                    top: percentHeight(context, 11.0),
                  ),
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
                        Strings.SELFIE,
                        color: Themes.purple,
                        fontSize: 22.0,
                        marginTop: 15.0,
                      ),
                      Label(
                        Strings.COMPLETE_THE_IDENTICATION,
                        color: Themes.purple,
                        marginTop: 5.0,
                      ),
                      //_buildUpload(),
                      _buildUploadImage(),
                      _buildPanelGuide(),
                      RoundButton(
                        marginTop: 20.0,
                        width: percentWidth(context, 65.0),
                        color: Themes.purpleDark,
                        label: Strings.SUBMIT,
                        onPressed: prop.bloc.onUploadSelfies,
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

  Widget _buildPanelGuide() => Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Image.asset(K.IMAGE_PATH + 'icons/phone-icon.png',
                  width: 20.0),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Label(
                  Strings.NEED_TO_USE,
                  color: Themes.purpleDark,
                  textAlign: TextAlign.left,
                  fontSize: 16.0,
                  marginBottom: 2.0,
                ),
                Text(
                  Strings.USE_YOUR,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _buildUploadImage() => Container(
        margin: const EdgeInsets.only(
          top: 20.0,
        ),
        child: GestureDetector(
          onTap: () {
            print('selfie');
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: percentWidth(context, 60.0),
                height: percentHeight(context, 30.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
              ),
              DottedBorder(
                dashPattern: [2, 2],
                strokeWidth: 1,
                radius: Radius.circular(5.0),
                child: SizedBox(
                  width: percentWidth(context, 55.0),
                  height: percentHeight(context, 27.0),
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: Image.asset(
                      K.IMAGE_PATH + 'icons/selfiies-icon.png',
                      height: 128.0,
                      width: 128.0,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Start Now ',
                          style: TextStyle(
                            color: Themes.purpleDark,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'or ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                          ),
                        ),
                        TextSpan(
                          text: 'Skip this time',
                          style: TextStyle(
                            color: Themes.purpleDark,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _buildProcess() => Container(
        margin: const EdgeInsets.only(top: 10.0),
        width: percentWidth(context, 75.0),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              width: percentWidth(context, 60.0),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  HorizontalLine(
                    width: percentWidth(
                      context,
                      55.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildCircle(),
                      _buildCircle(),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Label(
                  Strings.PROOF_OF_IDENTITY,
                  marginTop: 22.0,
                  color: Themes.purple,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0,
                ),
                Label(
                  Strings.SELFIES,
                  marginTop: 22.0,
                  paddingRight: 22.0,
                  color: Themes.purple,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0,
                )
              ],
            )
          ],
        ),
      );

  Widget _buildCircle({
    Color backColor = Colors.white,
    Color frontColor,
  }) =>
      Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Circle(
            color: backColor,
            width: 18.0,
            height: 18.0,
          ),
          Circle(
            color: frontColor ?? Themes.purple,
            width: 12.0,
            height: 12.0,
          ),
        ],
      );
}
