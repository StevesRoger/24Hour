import 'package:flutter/material.dart';

abstract class BaseBloc<T> {
  final BuildContext context;
  
  T prop;

  BaseBloc(this.context);

  void init() {}

  void dispose();
}
