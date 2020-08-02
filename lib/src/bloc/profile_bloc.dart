import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twentyfour_hour/src/model/item_select.dart';

import 'package:twentyfour_hour/src/screen/profile/profile_prop.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

import 'base_bloc.dart';

class KycBloc extends BaseBloc<ProfileScreenProp> {
  final identityTypeStream = BehaviorSubject<ItemSelect>();

  KycBloc(BuildContext context) : super(context);

  void onSelectIdentityType(ItemSelect itemSelect) {
    switch (itemSelect.value) {
      case 0:
        prop.identityType = K.identityType[itemSelect.value];
        break;
      case 1:
        prop.identityType = K.identityType[itemSelect.value];
        break;
      case 2:
        prop.identityType = K.identityType[itemSelect.value];
        break;
      default:
        prop.identityType = K.identityType[0];
        break;
    }
    identityTypeStream.add(itemSelect);
  }

  void onUploadIdentity(String type, dynamic value) {
    print('upload identity $type');
  }

  void onUploadSelfies() {
    print('Selfies');
    prop.user.kycStatus = true;
    Navigator.pushNamed(context, Routes.KYC, arguments: prop.user);
  }

  @override
  void dispose() {
    prop?.dispose();
    identityTypeStream?.close();
  }
}
