import 'package:dio/dio.dart';
import 'package:twentyfour_hour/src/model/response_entity.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/http_util.dart';

import '../util/tools.dart';

class UserProfileService {
  Future<ResponseEntity> getUserWallet(String token) async {
    try {
      var response = await dio.get(
        '/wallet/balance',
        options: Options(
          headers: {
            'Accept': HttpHeader.ACCEPT_JSON,
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return ResponseEntity.fromResponse(response);
    } catch (ex) {
      logError(ex.toString());
      return ResponseEntity.errorWithMessage(httpUtil.handleError(ex));
    }
  }
}
