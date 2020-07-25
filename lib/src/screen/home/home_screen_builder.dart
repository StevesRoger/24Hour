import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/component/widget/icon_menu.dart';
import 'package:twentyfour_hour/src/component/widget/vertical_divider.dart';
import 'package:twentyfour_hour/src/model/user.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

class HomeScreenBuilder {
  static Widget buildActionBar({
    Function onPressedMenu,
    Function onPressedNotification,
  }) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: onPressedMenu ?? () {},
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/header-logo.png"),
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
                onPressed: onPressedNotification ?? () {},
              ),
            ),
          )
        ],
      ),
    );
  }

  static Widget buildProfile(
    BuildContext context,
    User user,
  ) {
    return Stack(
      children: <Widget>[
        Container(
          height: 350.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Themes.purple, Themes.purpleDark],
              stops: [0.0, 0.6],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset(
                    "assets/images/profile-logo.png",
                    height: 70,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    user.username,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: RichText(
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
                ),
                RichText(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: <Widget>[
                      _buildRoundRectangle(250.0, Themes.purple),
                      _buildRoundRectangle(125.0, Themes.blueColor),
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    _buildMenu(context, user),
                    _buildWalletTotal(user),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  static Widget _buildRoundRectangle(
    double width,
    Color color, {
    double height = 10.0,
    Widget child,
    double radius = 10.0,
    BoxBorder border,
  }) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: new BoxDecoration(
        border: border,
        color: color,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
      child: child,
    );
  }

  static Widget _buildWalletTotal(User user) {
    return Center(
      child: _buildRoundRectangle(
        300.0,
        Colors.white,
        height: 40.0,
        radius: 30.0,
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

  static Widget _buildMenu(BuildContext context, User user) {
    return Container(
      margin: EdgeInsets.only(
        top: 22.0,
      ),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
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
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconMenu(
                'assets/images/icons/investment-packages.png',
                Strings.INVESTMENT,
                padding: const EdgeInsets.only(right: 5.0),
              ),
              IconMenu(
                'assets/images/icons/wallet.png',
                Strings.WALLET,
              ),
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
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
