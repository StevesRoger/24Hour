import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/model/item_select.dart';

import 'hex_color.dart';

class K {
  static final sex = [ItemSelect('Male'), ItemSelect('Female')];
  static final countries = [
    ItemSelect('+855 Cambodia', value: '+855'),
    ItemSelect('+66 Thailand', value: '+66'),
    ItemSelect('+84 Vietnam', value: '+84'),
    ItemSelect('+856 Lao', value: '+856'),
  ];
  static final identityType = [
    ItemSelect('ID Card', value: 0),
    ItemSelect('Passport', value: 1),
    ItemSelect('Driver Licience', value: 2),
  ];
  static const IMAGE_PATH = 'assets/images/';
}

class Strings {
  static const APP_NAME = 'AS24Hour';
  static const NA = 'N/A';
  static const ID_CARD = 'ID Card';
  static const UPLOAD_DOCUMENT = 'Upload document with your phone';
  static const NEED_TO_USE = 'Need to use your mobile to pass photo selfie?';
  static const USE_YOUR = 'Use your phone to complete verifycation processing';
  static const PASSPORT = 'Passport';
  static const DRIVER_LICIENCE = 'Driver Licience';
  static const CHOOSE_YOUR_ID_TYPE = 'Choose your ID type';
  static const COMPLETE_THE_IDENTICATION = 'Complete the identication process';
  static const VERIFY_YOUR_KYC = 'Verify Your KYC';
  static const DEFAULT_ID = 'Default ID';
  static const SEX = 'Sex';
  static const WAITING = 'Waiting...';
  static const PROCESSING = 'Processing...';
  static const VERIFY_KYC = 'Verify KYC';
  static const UNDER_REVIEW = 'Under Review';
  static const PERSONAL_INFO = 'Personal Info';
  static const WITHDRAWAL_ACCOUNT = 'Withdrawal Account';
  static const SECURITY = 'Secuirty';
  static const BANK_TRANSFER = 'Bank Transfer';
  static const CHANGE_PASSWORD = 'Change Password';
  static const CHANGE_PIN = 'Change PIN';
  static const SET_PIN = 'Set PIN****';
  static const SET_NEW_PIN = 'Set New PIN';
  static const USDT = 'USDT';
  static const COUNTRY = 'Country';
  static const MEMBER_LOGIN = 'MEMBER LOGIN';
  static const REGISTER = 'Register';
  static const OK = 'OK';
  static const PROOF_OF_IDENTITY = 'Proof of identity';
  static const SELFIE = 'SELEFIE';
  static const SELFIES = 'Selfies';
  static const CLOSE = 'Close';
  static const LOGIN = 'Login';
  static const SUBMIT = 'Submit';
  static const CONFIRM = 'Confirm';
  static const NEXT = 'Next';
  static const SIGN_UP = 'Sign up';
  static const DONE = 'Done';
  static const CANCEL = 'Cancel';
  static const ID_OR_EMAIL = 'ID or E-mail';
  static const EMAIL = 'E-mail';
  static const PHONE = 'Mobile Phone';
  static const PASSWORD = 'Password';
  static const CONFIRM_PASSWORD = 'Confirm Password';
  static const CONFIRM_MISMATCH_PASSWORD = 'Confirm password mismatch';
  static const REFFERAL_ID = 'Refferal ID User';
  static const CREATE_ACCOUNT = 'Create an Account!';
  static const BACK_TO_LOGIN = 'Back to login';
  static const FORGOT_PASSWORD = 'Forgot Your Password?';
  static const SOMETHING_WRONG = 'Something went wrong!';
  static const UNEXPECTED_ERROR = 'Unexpected error!';
  static const MISSING_ACCESS_TOKEN = 'Missing access token';
  static const GET_ACCESS_TOKEN_FAIL = 'Failed to get access token';
  static const BEST_PLACE = 'Best Place For\n Invest Your Money';
  static const EMPTY_ID_EMAIL = 'ID or Email can not be empty';
  static const EMPTY_EMAIL = 'Email can not be empty';
  static const EMPTY_PHONE = 'Phone number can not be empty';
  static const EMPTY_LAST_NAME = 'Last name can not be empty';
  static const EMPTY_NEW_PASSWORD = 'New password can not be empty';
  static const EMPTY_ACCOUNT_NAME = 'Account name can not be empty';
  static const EMPTY_NEW_PIN = 'New pin can not be empty';
  static const EMPTY_WALLET_ADDRESS = 'Wallet address can not be empty';
  static const EMPTY_CURRENT_PASSWORD = 'Current password can not be empty';
  static const EMPTY_BANK_NAME = 'Bank name can not be empty';
  static const EMPTY_CURRENT_PIN = 'Current pin can not be empty';
  static const EMPTY_FIRST_NAME = 'First name can not be empty';
  static const EMPTY_SEX = 'Sex can not be empty';
  static const EMPTY_COUNTRY = 'Country can not be empty';
  static const EMPTY_PASSWORD = 'Password can not be empty';
  static const EMPTY_REFFERAL_ID = 'Refferal id can not be empty';
  static const EMPTY_CONFIRM_PASSWORD = 'Confirm password can not be empty';
  static const EMPTY_ACCOUNT_NUMBER = 'Account number can not be empty';
  static const EMPTY_CONFIRM_PIN = 'Confirm pin can not be empty';
  static const LOGIN_FAILED = 'Login failed';
  static const REGISTER_FAILED = 'Register failed';
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

  static const LAST_NAME = 'Last Name';
  static const CURRENT_PASSWORD = 'Current Password';
  static const BANK_NAME = 'Bank Name';
  static const ACCOUNT_NAME = 'Account Name';
  static const ACCOUNT_NUMBER = 'Account Number';
  static const CONFIRM_PIN = 'Confirm PIN';
  static const NEW_PASSWORD = 'New Password';
  static const CURRENT_PIN = 'Current PIN';
  static const INPUT_NEW_PIN = 'Input the New PIN';
  static const WALLET_ADDRESS = 'Wallet Address';
  static const NEW_PIN = 'New PIN';
  static const FIRST_NAME = 'First Name';
  static const COPY_RIGHT = 'Copyright © 2020 As24Hour All Rights Reserved';
}

class Routes {
  static const LAUNCH = '/';
  static const HOME = '/home';
  static const START = '/start';
  static const LOGIN = '/login';
  static const SIGN_UP = '/signUp';
  static const KYC = '/profile';
  static const IDENTITY_VERIFY = '/identity-verify';
  static const SELFIES_VERIFY = '/selfies-verify';
  static const CHANGE_PASSWORD = '/change-password';
  static const CHANGE_PIN = '/change-pin';
  static const SET_PIN = '/set-pin';
  static const BANK_TRANSFER = '/bank-transfer';
  static const USDT = '/usdt';
}

class Themes {
  static final purpleDark = HexColor('#20144e');
  static final purpleDarkStatusBar = HexColor('#160e38');
  static final purple = HexColor('#802779');
  static final blueColor = HexColor('#1bacd7');
  static final pinkColor = HexColor('#802779');
  static final bg_gray = HexColor('f3f4f5');

  //static final statusBarColor = HexColor('#1b1045');
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
