import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:twentyfour_hour/src/component/earning_progress.dart';
import 'package:twentyfour_hour/src/component/gradient_panel.dart';
import 'package:twentyfour_hour/src/component/round_rectangle.dart';
import 'package:twentyfour_hour/src/component/widget/icon_menu.dart';
import 'package:twentyfour_hour/src/component/widget/label.dart';
import 'package:twentyfour_hour/src/component/widget/vertical_divider.dart';
import 'package:twentyfour_hour/src/model/user.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

class HomeScreenBuilder {
  static Widget buildActionBar({
    Function onPressedMenu,
    Function onPressedNotification,
  }) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            FontAwesome.menu,
            color: Colors.white,
          ),
          onPressed: onPressedMenu,
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
              ),
              onPressed: onPressedNotification,
            ),
          ),
        )
      ],
    );
  }

  static Widget buildBody(BuildContext context, User user) {
    return Stack(
      children: <Widget>[
        GradientPanel(),
        Column(
          children: <Widget>[
            Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.white,
                customBorder: const CircleBorder(),
                onTap: () => Navigator.pushNamed(context, Routes.KYC),
                child: Container(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    "assets/images/profile-logo.png",
                    height: 70,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            Label(
              user.username,
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
                    text: user.package,
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
                      text: '\$${user.availableEarning}',
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
                _buildMenu(user),
                _buildWalletTotal(context, user),
              ],
            )
          ],
        )
      ],
    );
  }

  static Widget _buildWalletTotal(BuildContext context, User user) {
    return Center(
      child: Rectangle(
        width: percentWidth(context, 70.0),
        height: 40.0,
        radius: 30.0,
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
                text: 'USD ${user.total}',
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
  }

  static Widget _buildMenu(User user) {
    return Container(
      margin: EdgeInsets.only(
        top: 22.0,
      ),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildWalletBalance(
                  'USD ${user.deposit}',
                  Strings.DEPOSIT_WALLET,
                ),
                VDivider(),
                _buildWalletBalance(
                  'USD ${user.registerPoint}',
                  Strings.REGISTER_WALLET,
                ),
                VDivider(),
                _buildWalletBalance(
                  'USD ${user.cash}',
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

  static Widget _buildWalletBalance(String balance, String label) {
    return Container(
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
}
