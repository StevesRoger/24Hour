import 'dart:io';

import 'package:dio/dio.dart';

import 'constant.dart';
import 'tools.dart';

class HttpUtil {
  // Singleton factory
  static final _instance = HttpUtil._init();

  factory HttpUtil() => _instance;

  final Dio dio = Dio();

  HttpUtil._init() {
    dio.options.baseUrl = API.BASE_URL;
    dio.options.connectTimeout = API.TIMEOUT;
    dio.options.receiveTimeout = API.TIMEOUT;
    dio.options.sendTimeout = API.TIMEOUT;
    dio.interceptors.add(
      LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (message) => log('DIO ---> ', message)),
    );
  }

  Future<bool> checkInternetConnection() async {
    try {
      logInfo('check connection');
      var result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        logInfo('has internet connection');
        return true;
      } else {
        logInfo('no internet connection');
        return false;
      }
    } catch (ex) {
      logError(ex.toString());
      return false;
    }
  }

  String handleError(Exception ex) {
    String message = '';
    if (ex is DioError) {
      switch (ex.type) {
        case DioErrorType.CONNECT_TIMEOUT:
          message = 'Connection timeout';
          break;
        case DioErrorType.SEND_TIMEOUT:
          message = 'Send request timeout';
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          message = 'Server response timeout';
          break;
        case DioErrorType.RESPONSE:
          message = 'Server Response not success';
          break;
        case DioErrorType.CANCEL:
          message = 'Request to server was cancelled';
          break;
        case DioErrorType.DEFAULT:
          if (ex.error is SocketException)
            message = 'Connection refused';
          else
            message = 'Connection to server failed due to internet';
          break;
        default:
          message = ex.toString();
          break;
      }
    } else
      message = Strings.UNEXPECTED_ERROR;
    return message;
  }
}

final httpUtil = HttpUtil();
final dio = httpUtil.dio;
