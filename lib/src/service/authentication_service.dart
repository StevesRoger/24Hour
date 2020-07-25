import 'package:dio/dio.dart';
import 'package:twentyfour_hour/src/model/response_entity.dart';
import 'package:twentyfour_hour/src/util/http_util.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

class AuthenticationService {
  Future<ResponseEntity> login(String email, String pwd) async {
    try {
      var response = await dio.post(
        '/login',
        data: {'account_no': email, 'password': pwd},
        options: Options(
          headers: buildRequestHeader(),
        ),
      );
      return ResponseEntity.fromResponse(response);
    } catch (ex) {
      logError(ex.toString());
      return ResponseEntity.errorWithMessage(httpUtil.handleError(ex));
    }
  }

  Future<ResponseEntity> register(Map json) async {
    try {
      var response = await dio.post(
        '/register',
        data: json,
        options: Options(
          headers: buildRequestHeader(),
        ),
      );
      return ResponseEntity.fromResponse(response);
    } catch (ex) {
      logError(ex.toString());
      return ResponseEntity.errorWithMessage(httpUtil.handleError(ex));
    }
  }
}
