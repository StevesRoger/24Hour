import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twentyfour_hour/src/util/hex_color.dart';

import 'src/screen/home/home_screen.dart';
import 'src/screen/launch/launch_screen.dart';
import 'src/screen/login/login_screen.dart';
import 'src/screen/start/start_screen.dart';
import 'src/util/constant.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details); // log expected error
  };
  runApp(TwentyFourApp());
}

class TwentyFourApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: HexColor("#1b1045"),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.APP_NAME,
      theme: ThemeData(
        primarySwatch: Themes.primarySwatchColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => LaunchScreen(),
        '/start': (_) => StartScreen(),
        '/login': (_) => LoginScreen(),
        '/home': (_) => HomeScreen(),
      },
    );
  }
}
