import 'package:dio/dio.dart';
import 'package:twentyfour_hour/src/util/common_function.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/http_util.dart';

class AuthenticationService {
  Future<Map<String, Object>> login(String email, String pwd) async {
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
      return response.data as Map;
    } on DioError catch (ex) {
      logInfo(response?.statusCode?.toString());
      logInfo(response?.statusMessage?.toString());
      logInfo(response?.data?.toString());
      logInfo(ex.message);
    } on Exception catch (ex) {
      logInfo(ex.toString());
    }
    return Map();
  }
}
