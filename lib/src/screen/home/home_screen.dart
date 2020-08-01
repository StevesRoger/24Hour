import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:provider/provider.dart';
import 'package:twentyfour_hour/src/bloc/home_bloc.dart';
import 'package:twentyfour_hour/src/component/widget/earning_progress.dart';
import 'package:twentyfour_hour/src/component/gradient_panel.dart';
import 'package:twentyfour_hour/src/component/loading_panel.dart';
import 'package:twentyfour_hour/src/component/widget/round_rectangle.dart';
import 'package:twentyfour_hour/src/component/scaffold_safe_area.dart';
import 'package:twentyfour_hour/src/component/widget/icon_menu.dart';
import 'package:twentyfour_hour/src/component/widget/label.dart';
import 'package:twentyfour_hour/src/component/widget/vertical_divider.dart';
import 'package:twentyfour_hour/src/model/user.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

import 'home_screen_prop.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final prop = HomeScreenProp();

  @override
  void didChangeDependencies() {
    prop.init(Provider.of<HomeBloc>(context), context);
    prop.bloc.fetchUserInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldSafeArea(
      backgroundColor: Themes.purpleDark,
      resizeToAvoidBottomPadding: false,
      body: StreamBuilder<User>(
        stream: prop.bloc.userStream,
        builder: (_, snap) {
          prop.user = snap.data ?? null;
          return LoadingPanel(
            isLoading: snap.connectionState == ConnectionState.waiting &&
                prop.user == null,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: prop.user != null
                  ? Column(
                      children: <Widget>[
                        _buildActionBar(),
                        _buildBody(),
                        Image.asset(
                          'assets/images/footer-banner.png',
                          fit: BoxFit.fitHeight,
                          //fit: BoxFit.fill,
                        )
                      ],
                    )
                  : Column(
                      children: <Widget>[
                        _buildActionBar(),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildActionBar() => Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesome.menu,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/header-logo.png',
                height: 35.0,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(
                  Icons.notifications_active,
                  color: Colors.white,
                  size: 26.0,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      );

  Widget _buildBody() => Stack(
        children: <Widget>[
          GradientPanel(),
          Column(
            children: <Widget>[
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white,
                  customBorder: const CircleBorder(),
                  onTap: () => Navigator.pushNamed(
                    context,
                    Routes.KYC,
                    arguments: prop.user,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset(
                      'assets/images/profile-logo.png',
                      height: 70,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              Label(
                prop.user.username,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: Strings.ACTIVATE_PACKAGE,
                    ),
                    TextSpan(
                      text: prop.user.package,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 2.0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: Strings.AVAILABLE_EARNING,
                      ),
                      TextSpan(
                        text: '\$${prop.user.availableEarning}',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              EarningProgress(),
              Stack(
                children: <Widget>[
                  _buildMenu(),
                  _buildWalletTotal(),
                ],
              )
            ],
          )
        ],
      );

  Widget _buildWalletTotal() => Center(
        child: RoundRectangle(
          width: percentWidth(context, 70.0),
          height: 40.0,
          borderRadius: const BorderRadius.all(
            Radius.circular(30.0),
          ),
          color: Colors.white,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                color: Themes.purpleDark,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'WALLET BALANCE: ',
                ),
                TextSpan(
                  text: 'USD ${prop.user.total}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          border: Border.all(
            color: Themes.purple,
            width: 2.5,
          ),
        ),
      );

  Widget _buildMenu() {
    return Container(
      margin: EdgeInsets.only(
        top: 22.0,
      ),
      color: Themes.bg_gray,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildWalletBalance(
                  'USD ${prop.user.deposit}',
                  Strings.DEPOSIT_WALLET,
                ),
                VDivider(),
                _buildWalletBalance(
                  'USD ${prop.user.registerPoint}',
                  Strings.REGISTER_WALLET,
                ),
                VDivider(),
                _buildWalletBalance(
                  'USD ${prop.user.cash}',
                  Strings.CASH_WALLET,
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              IconMenu(
                'assets/images/icons/investment-packages.png',
                Strings.INVESTMENT,
                onTap: () {
                  print('Test');
                },
              ),
              IconMenu('assets/images/icons/wallet.png', Strings.WALLET,
                  onTap: () {
                print('Test');
              }),
              IconMenu(
                'assets/images/icons/referral.png',
                Strings.REFERRAL,
              ),
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconMenu(
                'assets/images/icons/deposit.png',
                Strings.DEPOSIT,
              ),
              IconMenu(
                'assets/images/icons/transfer.png',
                Strings.TRANSFER,
              ),
              IconMenu(
                'assets/images/icons/withdrawal.png',
                Strings.WITHDRAWAL,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              IconMenu(
                'assets/images/icons/video.png',
                Strings.VIDEO_UPLOAD,
                padding: const EdgeInsets.only(
                  left: 8.0,
                  bottom: 5.0,
                ),
              ),
              IconMenu(
                'assets/images/icons/earning.png',
                Strings.EARNING,
                padding: const EdgeInsets.only(
                  top: 2.0,
                  bottom: 5.0,
                ),
                height: 60.0,
                width: 60.0,
              ),
              IconMenu(
                'assets/images/icons/reward.png',
                Strings.REWARD,
                padding: const EdgeInsets.only(
                  bottom: 5.0,
                ),
              ),
            ],
          ),
          /*GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            childAspectRatio: 1.4,
            crossAxisCount: 3,
            children: [
              IconMenu(
                'assets/images/icons/investment-packages.png',
                Strings.INVESTMENT,
              ),
              IconMenu(
                'assets/images/icons/wallet.png',
                Strings.WALLET,
              ),
              IconMenu(
                'assets/images/icons/referral.png',
                Strings.REFERRAL,
              ),
              IconMenu(
                'assets/images/icons/deposit.png',
                Strings.DEPOSIT,
              ),
              IconMenu(
                'assets/images/icons/transfer.png',
                Strings.TRANSFER,
              ),
              IconMenu(
                'assets/images/icons/withdrawal.png',
                Strings.WITHDRAWAL,
              ),
              IconMenu(
                'assets/images/icons/video.png',
                Strings.VIDEO_UPLOAD,
                padding: const EdgeInsets.only(
                  right: 8.0,
                ),
              ),
              IconMenu(
                'assets/images/icons/earning.png',
                Strings.EARNING,
                padding: const EdgeInsets.only(top: 2.0),
                height: 60.0,
                width: 60.0,
              ),
              IconMenu(
                'assets/images/icons/reward.png',
                Strings.REWARD,
              ),
            ],
          ),*/
        ],
      ),
    );
  }

  Widget _buildWalletBalance(String balance, String label) => Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text(
              balance,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Themes.purple,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      );
}
