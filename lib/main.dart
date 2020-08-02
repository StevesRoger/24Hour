import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:provider/provider.dart';
import 'package:twentyfour_hour/src/screen/home/home_screen.dart';
import 'package:twentyfour_hour/src/screen/launch/launch_screen.dart';
import 'package:twentyfour_hour/src/screen/login_screen/login_screen.dart';
import 'package:twentyfour_hour/src/screen/signup/signup_screen.dart';
import 'package:twentyfour_hour/src/screen/start/start_screen.dart';

import 'src/bloc/bank_transfer_bloc.dart';
import 'src/bloc/base_bloc.dart';
import 'src/bloc/change_password_bloc.dart';
import 'src/bloc/home_bloc.dart';
import 'src/bloc/profile_bloc.dart';
import 'src/bloc/launch_bloc.dart';
import 'src/bloc/login_bloc.dart';
import 'src/bloc/signup_bloc.dart';
import 'src/bloc/usdt_bloc.dart';
import 'src/screen/bank_transfer/bank_transfer_screen.dart';
import 'src/screen/change_password/change_password_screen.dart';
import 'src/screen/change_password/change_pin_screen.dart';
import 'src/screen/change_password/set_pin_screen.dart';
import 'src/screen/profile/identity_verify_screen.dart';
import 'src/screen/profile/profile_screen.dart';
import 'src/screen/profile/selfies_verify_screen.dart';
import 'src/screen/usdt/usdt_screen.dart';
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
    FlutterStatusbarcolor.setStatusBarColor(Themes.purpleDarkStatusBar);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.APP_NAME,
      theme: ThemeData(
        primarySwatch: Themes.primarySwatchColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.LAUNCH,
      routes: <String, WidgetBuilder>{
        Routes.IDENTITY_VERIFY: (context) => KycVerifyScreen(),
        Routes.SELFIES_VERIFY: (context) => SelfiesVerifyScreen(),
        Routes.START: (context) => StartScreen(),
        Routes.LAUNCH: (context) => _buildScreen(
              LaunchScreen(),
              LaunchBloc(context),
            ),
        Routes.LOGIN: (context) => _buildScreen(
              LoginScreen(),
              LoginBloc(context),
            ),
        Routes.SIGN_UP: (context) => _buildScreen(
              SignUpScreen(),
              SignUpBloc(context),
            ),
        Routes.HOME: (context) => _buildScreen(
              HomeScreen(),
              HomeBloc(context),
            ),
        Routes.KYC: (context) => _buildScreen(
              ProfileScreen(),
              KycBloc(context),
            ),
        Routes.CHANGE_PASSWORD: (context) => _buildScreen(
              ChangePasswordScreen(),
              ChangePasswordBloc(context),
            ),
        Routes.CHANGE_PIN: (context) => _buildScreen(
              ChangePinScreen(),
              ChangePasswordBloc(context),
            ),
        Routes.SET_PIN: (context) => _buildScreen(
              SetPinScreen(),
              ChangePasswordBloc(context),
            ),
        Routes.BANK_TRANSFER: (context) => _buildScreen(
              BankTransferScreen(),
              BankTransferBloc(context),
            ),
        Routes.USDT: (context) => _buildScreen(
              USDTScreen(),
              USDTBloc(context),
            ),
      },
    );
  }

  Widget _buildScreen<T extends BaseBloc>(Widget screen, T bloc) {
    return Provider<T>(
      child: screen,
      create: (context) => bloc,
      dispose: (context, bloc) => bloc?.dispose(),
    );
  }
}
