import 'package:twentyfour_hour/src/bloc/base_prop.dart';
import 'package:twentyfour_hour/src/bloc/kyc_bloc.dart';
import 'package:twentyfour_hour/src/model/item_select.dart';
import 'package:twentyfour_hour/src/model/user.dart';

class KycScreenProp extends BaseProp<KycBloc> {
  User user;
  final personalInfo = List<ItemSelect>();
}
