import 'package:dio/dio.dart';
import 'package:twentyfour_hour/src/util/constant.dart';
import 'package:twentyfour_hour/src/util/http_util.dart';

class UserProfileService {
  Future<Map<String, Object>> getUserInfo(String token) async {
    var response;
    try {
      response = await dio.post(
        '${API.BASE_URL}/details',
        options: Options(
          headers: {
            'accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return response.data as Map;
    } on DioError catch (e) {
      print(response.statusCode.toString());
      print(e.message);
      throw Exception(
          'Failed Load Data with status code ${response.statusCode}');
    }
  }

  Future<Map<String, Object>> listAllPackage(String token) async {
    var response;
    try {
      response = await dio.get(
        '${API.BASE_URL}/package/packages',
        options: Options(
          headers: {
            'accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return response.data as Map;
    } on DioError catch (e) {
      print(response.statusCode.toString());
      print(e.message);
      throw Exception(
          'Failed Load Data with status code ${response.statusCode}');
    }
  }

  Future<Map<String, Object>> getUserWallet(String token) async {
    var response;
    try {
      response = await dio.get(
        '${API.BASE_URL}/wallet/balance',
        options: Options(
          headers: {
            'accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return response.data as Map;
    } on DioError catch (e) {
      print(response.statusCode.toString());
      print(e.message);
      throw Exception(
          'Failed Load Data with status code ${response.statusCode}');
    }
  }
}
