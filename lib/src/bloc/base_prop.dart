import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:twentyfour_hour/src/bloc/base_bloc.dart';

abstract class BaseProp<T extends BaseBloc> {
  ProgressDialog _progress;
  T _bloc;
  BuildContext _context;

  void init(T bloc, BuildContext context) {
    _progress = ProgressDialog(context, isDismissible: false);
    _bloc = bloc;
    _bloc?.prop = this;
    _context = context;
  }

  T get bloc => _bloc;

  ProgressDialog get progress => _progress;

  BuildContext get context => _context;

  void dispose();
}
