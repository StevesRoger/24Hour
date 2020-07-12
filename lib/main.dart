import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'src/bloc/home_bloc.dart';
import 'src/bloc/launch_bloc.dart';
import 'src/bloc/login_bloc.dart';
import 'src/screen/home/home_screen.dart';
import 'src/screen/launch/launch_screen.dart';
import 'src/screen/login/login_screen.dart';
import 'src/screen/sign_up/sign_up_screen.dart';
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
    /*SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Themes.statusBarColor, // Color for Android
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness:
          Brightness.light // Dark == white status bar -- for IOS.
      ),
    );*/
    FlutterStatusbarcolor.setStatusBarColor(Themes.purpleDark);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    return MultiProvider(
      providers: _createProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Strings.APP_NAME,
        theme: ThemeData(
          primarySwatch: Themes.primarySwatchColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: Routes.LAUNCH,
        routes: <String, WidgetBuilder>{
          Routes.LAUNCH: (_) => LaunchScreen(),
          Routes.START: (_) => StartScreen(),
          Routes.LOGIN: (_) => LoginScreen(),
          Routes.SIGN_UP: (_) => SignUpScreen(),
          Routes.HOME: (_) => HomeScreen(),
        },
      ),
    );
  }

  List<SingleChildWidget> _createProvider() {
    return [
      Provider<LaunchBloc>(
        create: (context) => LaunchBloc(),
        dispose: (_, bloc) => bloc?.dispose(),
      ),
      Provider<LoginBloc>(
        create: (context) => LoginBloc(),
        dispose: (_, bloc) => bloc?.dispose(),
      ),
      Provider<HomeBloc>(
        create: (context) => HomeBloc(),
        dispose: (_, bloc) => bloc?.dispose(),
      ),
    ];
  }
}
