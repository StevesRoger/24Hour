import 'dart:ui';

import 'package:flutter/material.dart';

import 'hex_color.dart';

class Strings {
  static const APP_NAME = 'TwentyFour';
  static const BUTTON_LOGIN = 'Login';
  static const INPUT_DONE = 'Done';
  static const CANCEL = 'Cancel';
  static const SMALL_WORDS =
      'Put your investing ideas into action with\n a full range of investments. Enjoy real\n benefits and rewards on Online Trade';
}

class Themes {
  static final purpleDark = HexColor("#20144e");
  static final purple = HexColor("#802779");
  static final blueColor = HexColor("#1bacd7");
  static final pinkColor = HexColor("#802779");
  static final primarySwatchColor = MaterialColor(0xFF802779, color);
}

class Styles {}

class FontNames {
  static const LONGDON_DECORATIVE = 'Longdon Decorative';
  static const ROBOTO = 'Roboto';
  static const OPEN_SANS = 'Open Sans';
}

class API {
  //static const BASE_URL = 'https://as24hour.com/api';//production
  static const BASE_URL = 'http://demo.as24hour.com/api'; //testing
  static const int TIMEOUT = 20000;
}

class LogSymbol {
  static const INFO = "===> ";
  static const DEBUG = "---> ";
}

Map<int, Color> color = {
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
