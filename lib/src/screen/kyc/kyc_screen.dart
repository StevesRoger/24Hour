import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:provider/provider.dart';
import 'package:twentyfour_hour/src/bloc/kyc_bloc.dart';
import 'package:twentyfour_hour/src/component/app_bar.dart';
import 'package:twentyfour_hour/src/component/gradient_panel.dart';
import 'package:twentyfour_hour/src/component/scaffold_safe_area.dart';
import 'package:twentyfour_hour/src/component/widget/label.dart';
import 'package:twentyfour_hour/src/component/widget/profile.dart';
import 'package:twentyfour_hour/src/component/widget/round_rectangle.dart';
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
    prop.init(Provider.of<KycBloc>(context), context);
    prop.user = ModalRoute.of(context).settings.arguments;
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
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    top: percentHeight(context, 11.0),
                  ),
                  color: Themes.bg_gray,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Label(
                        prop.user.username,
                        marginTop: 32.0,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Themes.purpleDark,
                      ),
                      Label(
                        prop.user.personal['name'] ?? Strings.NA,
                        fontSize: 16.0,
                        color: Themes.purpleDark,
                      ),
                      _buildButtonVerifyKyc(),
                      _buildPersonal(),
                      _buildWithdrawalAndSecurity(),
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

  Widget _buildPersonal() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Label(
            Strings.PERSONAL_INFO,
            color: Themes.purpleDark,
            marginBottom: 10.0,
            paddingLeft: 5.0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(7.0),
              ),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Column(
              children: <Widget>[
                _buildRectangle(
                  prop.user.personal['sex'],
                  icon: Icons.people,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                _buildRectangle(
                  prop.user.personal['country_code'],
                  icon: FontAwesome.globe,
                  border: const Border(
                    top: BorderSide(color: Colors.black12),
                    bottom: BorderSide(color: Colors.black12),
                  ),
                ),
                _buildRectangle(
                  prop.user.personal['email'],
                  icon: Icons.email,
                  border: const Border(
                    bottom: BorderSide(color: Colors.black12),
                  ),
                ),
                _buildRectangle(
                  prop.user.personal['phone'],
                  icon: Icons.phone_iphone,
                  border: const Border(
                    bottom: BorderSide(color: Colors.black12),
                  ),
                ),
                _buildRectangle(
                  prop.user.personal['ref_id'],
                  icon: Icons.portrait,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  Widget _buildWithdrawalAndSecurity() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Label(
            Strings.WITHDRAWAL_ACCOUNT,
            color: Themes.purpleDark,
            marginLeft: percentWidth(context, 8.0),
            marginTop: 10.0,
            marginBottom: 10.0,
          ),
          _buildRectangle(
            Strings.BANK_TRANSFER,
            widget: Image.asset(
              'assets/images/icons/bank-color.png',
              height: 22.0,
              fit: BoxFit.fill,
            ),
            paddingLeft: percentWidth(context, 9.0),
            textColor: Themes.purple,
            width: 100.0,
            border: const Border(
              bottom: BorderSide(color: Colors.black12),
            ),
          ),
          _buildRectangle(
            Strings.USDT,
            widget: Image.asset(
              'assets/images/icons/usdt.png',
              height: 22.0,
              fit: BoxFit.fill,
            ),
            paddingLeft: percentWidth(context, 9.0),
            textColor: Themes.purple,
            width: 100.0,
          ),
          Label(
            Strings.SECURITY,
            color: Themes.purpleDark,
            marginLeft: percentWidth(context, 8.0),
            marginTop: 10.0,
            marginBottom: 10.0,
          ),
          _buildRectangle(
            Strings.CHANGE_PASSWORD,
            widget: Image.asset(
              'assets/images/icons/password-color.png',
              height: 24.0,
              fit: BoxFit.fill,
            ),
            paddingLeft: percentWidth(context, 9.0),
            textColor: Themes.purple,
            width: 100.0,
            border: const Border(
              bottom: BorderSide(color: Colors.black12),
            ),
          ),
          _buildRectangle(
            Strings.SET_PIN,
            widget: Image.asset(
              'assets/images/icons/pin-color.png',
              height: 21.0,
              fit: BoxFit.fill,
            ),
            paddingLeft: percentWidth(context, 9.0),
            textColor: Themes.purple,
            width: 100.0,
          ),
        ],
      );

  Widget _buildButtonVerifyKyc() => GestureDetector(
        onTap: () =>
            Navigator.pushNamed(context, Routes.KYC_VERIFY, arguments: prop),
        child: RoundRectangle(
          marginTop: 2.0,
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
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
          height: 20.0,
          color: Themes.purpleDark,
        ),
      );

  Widget _buildRectangle(
    String label, {
    Widget widget,
    IconData icon,
    double paddingLeft: 10.0,
    double textPaddingLeft = 10.0,
    double width = 90.0,
    Color iconColor = Colors.grey,
    Color textColor = Colors.grey,
    Border border,
    BorderRadiusGeometry borderRadius,
  }) {
    return RoundRectangle(
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
            label ?? Strings.NA,
            paddingLeft: textPaddingLeft,
            color: textColor,
            fontWeight: FontWeight.w500,
          )
        ],
      ),
      height: 40.0,
      width: percentWidth(
        context,
        width,
      ),
      borderRadius: borderRadius,
      border: border,
    );
  }
}
