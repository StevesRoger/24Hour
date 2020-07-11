import 'package:dio/dio.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

class ResponseEntity {
  String _message = '';
  String _statusMessage = '';
  Map<String, Object> _data = Map();
  int _statusCode = 999;

  ResponseEntity();

  ResponseEntity.errorWithMessage(String message)
      : _statusCode = 400,
        _message = message;

  ResponseEntity.error()
      : _statusCode = 400,
        _message = Strings.SOMETHING_WRONG;

  ResponseEntity.errorFromResponse(Response response) {
    if (response != null) {
      _statusCode = response.statusCode;
      _statusMessage = response.statusMessage;
      _message = response.data['message'] ?? '';
      _data = response.data ?? Map();
    }
  }

  ResponseEntity.fromResponse(Response response) {
    if (response != null) {
      _statusCode = response.statusCode;
      _statusMessage = response.statusMessage;
      _message = response.data['message'] ?? '';
      if (response.statusCode == 200) _data = response.data ?? Map();
    }
  }

  String get statusMessage => _statusMessage;

  String get message => _message;

  isSucceed() => _statusCode == 200 && _data['data'] != null;

  bool containKey(String key) => _data.containsKey(key);

  Map getData() => _data['data'] ?? Map();

  int get statusCode => _statusCode;
}
