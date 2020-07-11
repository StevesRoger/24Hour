import 'package:dio/dio.dart';
import 'package:twentyfour_hour/src/model/response_entity.dart';
import 'package:twentyfour_hour/src/util/common_function.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/http_util.dart';

class AuthenticationService {
  Future<ResponseEntity> login(String email, String pwd) async {
    Response response;
    try {
      response = await dio.post(
        '${API.BASE_URL}/login',
        data: {'account_no': email, 'password': pwd},
        options: Options(
          headers: {
            'Content-Type': 'application/json;charset=UTF-8',
            'accept': 'application/json',
          },
        ),
      );
      return ResponseEntity.fromResponse(response);
    } on DioError catch (ex) {
      logError(response?.statusCode?.toString());
      logError(response?.statusMessage?.toString());
      logError(response?.data?.toString());
      logError(ex.message);
    } catch (ex) {
      logError(ex.toString());
    }
    return ResponseEntity.errorFromResponse(response);
  }
}
