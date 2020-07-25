import 'dart:io' show Platform, exit;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

enum DeviceScreenType { Mobile, Tablet, Desktop }

bool isAndroid() {
  return Platform.isAndroid;
}

bool isIOS() {
  return Platform.isIOS;
}

void logInfo(Object message) {
  print('${LogSymbol.INFO}$message');
}

void logDebug(Object message) {
  debugPrint('${LogSymbol.DEBUG}$message');
}

void log(String symbol, Object message) {
  debugPrint('$symbol$message');
}

void logError(Object message) {
  debugPrint('${LogSymbol.ERROR}$message');
}

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  var deviceWidth = mediaQuery.size.shortestSide;
  if (deviceWidth > 600)
    return DeviceScreenType.Tablet;
  else if (deviceWidth > 1024) return DeviceScreenType.Desktop;
  return DeviceScreenType.Mobile;
}

Map<String, String> buildRequestHeader({
  String contentType = HttpHeader.CONTENT_TYPE_JSON,
  String accept = HttpHeader.ACCEPT_JSON,
}) {
  return {
    'Content-Type': contentType,
    'Accept': accept,
  };
}

void showSnackBar(BuildContext context, String message) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(message),
    ),
  );
}

Future<void> showMessageDialog({
  BuildContext context,
  String title,
  String message,
  Function onPressed,
}) async {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => isAndroid()
        ? AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  Strings.CLOSE,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  onPressed?.call();
                },
              ),
            ],
          )
        : Theme(
            data: ThemeData.dark(),
            child: CupertinoAlertDialog(
              title: Text(title),
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(message),
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text(
                    Strings.CLOSE,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (onPressed != null) onPressed.call();
                  },
                ),
              ],
            ),
          ),
  );
}
