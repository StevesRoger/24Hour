import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:twentyfour_hour/src/bloc/base_bloc.dart';

abstract class BaseProp<T extends BaseBloc> {
  ProgressDialog _progress;
  T _bloc;

  void init(T bloc, BuildContext context) {
    _bloc = bloc;
    _progress = ProgressDialog(context, isDismissible: false);
    _bloc?.prop = this;
  }

  T get bloc => _bloc;

  ProgressDialog get progress => _progress;
}
