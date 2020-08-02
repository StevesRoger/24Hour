import 'package:twentyfour_hour/src/bloc/base_prop.dart';
import 'package:twentyfour_hour/src/bloc/profile_bloc.dart';
import 'package:twentyfour_hour/src/model/item_select.dart';
import 'package:twentyfour_hour/src/model/user.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

class ProfileScreenProp extends BaseProp<KycBloc> {
  User user;
  ItemSelect identityType = K.identityType[0];
  final personalInfo = List<ItemSelect>();

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
