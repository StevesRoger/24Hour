import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: LoadingOverlay(
          isLoading: true,
          color: Colors.grey,
          child: Container(),
        ),
      ),
    );
  }
}
