import 'dart:io' show Platform, exit;

import 'package:flutter/material.dart';

import 'constant.dart';

bool isAndroid() {
  return Platform.isAndroid;
}

bool isIOS() {
  return Platform.isIOS;
}

void logInfo(String message) {
  print(LogSymbol.INFO + message);
}

void logDebug(String message) {
  debugPrint(LogSymbol.DEBUG + message);
}

void logError(String message) {
  debugPrint(LogSymbol.ERROR + message);
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

Future<void> showMessageDialog(
    {BuildContext context,
    String title,
    String message,
    Function onPressed}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
              if (onPressed != null) onPressed.call();
            },
          ),
        ],
      );
    },
  );
}

void fatalException(BuildContext context) {
  showMessageDialog(
    context: context,
    title: 'Unexcepted error',
    message: 'Something went wrong!',
    onPressed: () => exit(0),
  );
}
