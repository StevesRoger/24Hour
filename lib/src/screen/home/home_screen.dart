import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/service/user_profile_service.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/shared_pref.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final userService = UserProfileService();
  Map<String, Object> user;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.purpleDark,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
              future: getUserWallet(),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting)
                  return Container(
                    color: Themes.purpleDark,
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        _actionBar(),
                      ],
                    ),
                  );
                return Container(
                  color: Themes.purpleDark,
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      _actionBar(),
                      _profile(),
                      Container(
                        color: Colors.red,
                        child: Image.asset(
                          "assets/images/footer-banner.png",
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getUserWallet() async {
    user = await sharedPre.read('user');
    var token = user['token'];
    var response = await userService.getUserWallet(token);
    if (response != null && response.containsKey('data')) {
      var wallet = (response['data'] as Map);
      user['total'] = wallet['balance'];
      user['deposit'] = wallet['deposit'];
      user['cash'] = wallet['cash_balance'];
      user['register'] = wallet['register_point'];
      var package = wallet['active_package'];
      user['active_package'] = package == null ? 'N/A' : package['name'];
      user['available'] = package == null ? 0.0 : package['available'];
    }
  }

  Widget _actionBar() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: 40.0,
            ),
            onPressed: () {},
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
                  size: 30.0,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _profile() {
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
          onTap: () {
            /* setState(() {
              _isLoading = true;
            });*/
          },
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
                    user['username'],
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
                          text: 'Activated Packages: ',
                        ),
                        TextSpan(
                          text: '${user['active_package']}',
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
                        text: 'Available Earing: ',
                      ),
                      TextSpan(
                        text: '\$${user['available']}',
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
                    _buildMenu(),
                    _buildWalletTotal(),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildWalletTotal() {
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
                text: 'USD ${user['total']}',
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

  Widget _buildMenu() {
    return Container(
      margin: EdgeInsets.only(
        top: 22.0,
      ),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            //color: Colors.red,
            margin: EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildWalletBalance('USD ${user['deposit']}', 'Deposit Wallet'),
                //VerticalDivider(),
                Container(
                    height: 40,
                    child: const VerticalDivider(color: Colors.grey)),
                _buildWalletBalance(
                    'USD ${user['register']}', 'Register Wallet'),
                //VerticalDivider(),
                Container(
                    height: 40,
                    child: const VerticalDivider(color: Colors.grey)),
                _buildWalletBalance('USD ${user['cash']}', 'Cash Wallet'),
              ],
            ),
          ),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            childAspectRatio: 1.5,
            crossAxisCount: 3,
            children: [
              _buildMenuIcon('assets/images/icons/investment-packages.png',
                  'Investment\n Packages'),
              _buildMenuIcon(
                  'assets/images/icons/wallet.png', 'Wallet\n Transaction'),
              _buildMenuIcon(
                  'assets/images/icons/referral.png', 'Referal\n ID & Link'),
              _buildMenuIcon('assets/images/icons/deposit.png', 'Deposit'),
              _buildMenuIcon('assets/images/icons/transfer.png', 'Transfer'),
              _buildMenuIcon(
                  'assets/images/icons/withdrawal.png', 'Withdrawal'),
              _buildMenuIcon(
                'assets/images/icons/video.png',
                'Video\n Upload',
                padding: const EdgeInsets.only(
                  right: 8.0,
                ),
              ),
              _buildMenuIcon(
                'assets/images/icons/earning.png',
                'Earning\n History',
                padding: const EdgeInsets.only(top: 2.0),
                height: 60.0,
                width: 60.0,
              ),
              _buildMenuIcon(
                  'assets/images/icons/reward.png', 'Reward\n Bouns'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoundRectangle(
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

  Widget _buildWalletBalance(String balance, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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

  Widget _buildMenuIcon(
    String image,
    String label, {
    EdgeInsetsGeometry padding = const EdgeInsets.all(0.0),
    double width = 50.0,
    double height = 50.0,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            image,
            width: width,
            height: height,
            fit: BoxFit.scaleDown,
          ),
        ),
        Padding(
          padding: padding,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
        ),
      ],
    );
  }
}
