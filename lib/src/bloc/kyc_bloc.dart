import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/screen/kyc/kyc_screen_prop.dart';

import 'base_bloc.dart';

class KycBloc extends BaseBloc<KycScreenProp> {

  KycBloc(BuildContext context) : super(context);

  @override
  void dispose() {
    prop?.dispose();
  }
}
