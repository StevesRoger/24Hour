import 'dart:ui';

import 'package:flutter/material.dart';

import 'hex_color.dart';

class Strings {
  static const APP_NAME = 'TwentyFour';
  static const MEMBER_LOGIN = 'MEMBER LOGIN';
  static const LOGIN = 'Login';
  static const SIGN_UP = 'Sign up';
  static const DONE = 'Done';
  static const CANCEL = 'Cancel';
  static const EMAIL = 'ID or E-mail';
  static const PASSWORD = 'Password';
  static const CREATE_ACCOUNT = 'Create an Account!';
  static const FORGOT_PASSWORD = 'Forgot Your Password?';
  static const SOMETHING_WRONG = 'Something went wrong!';
  static const UNEXPECTED_ERROR = 'Unexpected error!';
  static const MISSING_ACCESS_TOKEN = 'Missing access token!';
  static const BEST_PLACE = 'Best Place For\n Invest Your Money';
  static const EMPTY_EMAIL = 'ID or Email can not be empty';
  static const EMPTY_PASSWORD = 'Password can not be empty';
  static const LOGIN_FAILED = 'Login failed';
  static const INCORRECT_USR_PWD = 'Incorrect username or password';
  static const ACTIVATE_PACKAGE = 'Activated Packages: ';
  static const AVAILABLE_EARNING = 'Available Earning: ';
  static const DEPOSIT_WALLET = 'Deposit Wallet';
  static const REGISTER_WALLET = 'Register Wallet';
  static const CASH_WALLET = 'Cash Wallet';
  static const INVESTMENT = 'Investment\n Packages';
  static const WALLET = 'Wallet\n Transaction';
  static const REFERRAL = 'Referral\n ID & Link';
  static const DEPOSIT = 'Deposit';
  static const TRANSFER = 'Transfer';
  static const WITHDRAWAL = 'Withdrawal';
  static const VIDEO_UPLOAD = 'Video\n Upload';
  static const EARNING = 'Earning\n History';
  static const REWARD = 'Reward\n Bouns';
  static const SMALL_WORDS =
      'Put your investing ideas into action with\n a full range of investments. Enjoy real\n benefits and rewards on Online Trade';
}

class Routes {
  static const LAUNCH = '/';
  static const HOME = '/home';
  static const START = '/start';
  static const LOGIN = '/login';
  static const SIGN_UP = '/signUp';
}

class Themes {
  static final purpleDark = HexColor('#20144e');
  static final purple = HexColor('#802779');
  static final blueColor = HexColor('#1bacd7');
  static final pinkColor = HexColor('#802779');
  static final gray = HexColor('#f1f1f6');
  static final statusBarColor = HexColor('#1b1045');
  static final primarySwatchColor = MaterialColor(0xFF802779, _color);
  static final Map<int, Color> _color = {
    50: Color.fromRGBO(4, 131, 184, .1),
    100: Color.fromRGBO(4, 131, 184, .2),
    200: Color.fromRGBO(4, 131, 184, .3),
    300: Color.fromRGBO(4, 131, 184, .4),
    400: Color.fromRGBO(4, 131, 184, .5),
    500: Color.fromRGBO(4, 131, 184, .6),
    600: Color.fromRGBO(4, 131, 184, .7),
    700: Color.fromRGBO(4, 131, 184, .8),
    800: Color.fromRGBO(4, 131, 184, .9),
    900: Color.fromRGBO(4, 131, 184, 1),
  };
}

class HttpHeader {
  static const CONTENT_TYPE_JSON = 'application/json;charset=UTF-8';
  static const ACCEPT_JSON = 'application/json';
}

class Styles {}

class FontNames {
  static const ROBOTO = 'Roboto';
  static const OPEN_SANS = 'Open Sans';
}

class API {
  //static const BASE_URL = 'https://as24hour.com/api';//production
  static const BASE_URL = 'http://demo.as24hour.com/api'; //testing
  static const int TIMEOUT = 20000;
}

class LogSymbol {
  static const INFO = 'INFO ===> ';
  static const DEBUG = 'DEBUG ---> ';
  static const ERROR = 'ERROR ~~~> ';
}
