import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:twentyfour_hour/src/component/app_bar.dart';
import 'package:twentyfour_hour/src/component/gradient_panel.dart';
import 'package:twentyfour_hour/src/component/scaffold_safe_area.dart';
import 'package:twentyfour_hour/src/component/widget/check_box.dart';
import 'package:twentyfour_hour/src/component/widget/circle.dart';
import 'package:twentyfour_hour/src/component/widget/horizontal_line.dart';
import 'package:twentyfour_hour/src/component/widget/label.dart';
import 'package:twentyfour_hour/src/component/widget/profile.dart';
import 'package:twentyfour_hour/src/component/widget/round_button.dart';
import 'package:twentyfour_hour/src/model/item_select.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

import 'profile_prop.dart';

class KycVerifyScreen extends StatefulWidget {
  @override
  _KycVerifyScreenState createState() => _KycVerifyScreenState();
}

class _KycVerifyScreenState extends State<KycVerifyScreen> {
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
                        Strings.PROOF_OF_IDENTITY,
                        color: Themes.purple,
                        fontSize: 22.0,
                        marginTop: 15.0,
                      ),
                      _buildDropdownCountry(),
                      _buildIdentityType(),
                      _buildUpload(),
                      _buildPanelGuide(),
                      RoundButton(
                        marginTop: 20.0,
                        width: percentWidth(context, 65.0),
                        color: Themes.purpleDark,
                        label: Strings.NEXT,
                        onPressed: () => Navigator.pushNamed(
                            context, Routes.SELFIES_VERIFY,
                            arguments: prop),
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
                  Strings.UPLOAD_DOCUMENT,
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

  Widget _buildUpload() => Container(
        margin: const EdgeInsets.only(
          top: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildUploadImage('fornt'),
            _buildUploadImage('back'),
          ],
        ),
      );

  Widget _buildUploadImage(String type) => GestureDetector(
        onTap: () => prop.bloc.onUploadIdentity(type, null),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 150,
              height: 100,
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
                width: 135,
                height: 85,
              ),
            ),
            Column(
              children: <Widget>[
                Image.asset(
                  K.IMAGE_PATH + 'icons/cloud-upload-icon.png',
                  height: 40,
                  width: 50,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Upload the ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.0,
                        ),
                      ),
                      TextSpan(
                        text: '$type \n',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'of your document',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _buildIdentityType() => Container(
        margin: const EdgeInsets.only(top: 25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Label(
              Strings.CHOOSE_YOUR_ID_TYPE,
              paddingLeft: 10.0,
              color: Themes.purple,
            ),
            StreamBuilder<ItemSelect>(
              initialData: prop.identityType,
              stream: prop.bloc.identityTypeStream,
              builder: (_, snap) => Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CheckBox<ItemSelect>(
                      label: Strings.ID_CARD,
                      value: K.identityType[0],
                      groupValue: snap.data,
                      activeColor: Themes.purpleDark,
                      onChanged: prop.bloc.onSelectIdentityType,
                    ),
                    CheckBox<ItemSelect>(
                      label: Strings.PASSPORT,
                      value: K.identityType[1],
                      groupValue: snap.data,
                      activeColor: Themes.purpleDark,
                      onChanged: prop.bloc.onSelectIdentityType,
                    ),
                    CheckBox<ItemSelect>(
                      label: Strings.DRIVER_LICIENCE,
                      value: K.identityType[2],
                      groupValue: snap.data,
                      onChanged: prop.bloc.onSelectIdentityType,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildDropdownCountry() => Container(
        margin: const EdgeInsets.only(top: 5.0),
        width: percentWidth(context, 65.0),
        child: DropdownButtonFormField<ItemSelect>(
          iconEnabledColor: Colors.black,
          items: K.countries
              .map(
                (item) => DropdownMenuItem(
                  value: item,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      item.label,
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (val) {},
          value: K.countries[0],
          // onSaved: onSaved,
          decoration: InputDecoration(
            prefixIconConstraints: BoxConstraints.tightFor(
              height: 25.0,
            ),
            prefixIcon: Icon(
              FontAwesome.globe,
              color: Colors.grey,
              size: 22.0,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 2.0,
                color: Colors.black,
              ),
            ),
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
                      _buildCircle(frontColor: Colors.grey),
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
                  color: Colors.grey,
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
