import 'package:dio/dio.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

import 'base_entity.dart';

class ResponseEntity extends BaseEntity {
  dynamic _message = '';
  String _statusMessage = '';
  Map<String, Object> _data = Map();
  int _statusCode = 999;

  ResponseEntity();

  ResponseEntity.errorWithMessage(String message)
      : _statusCode = 400,
        _message = message;

  ResponseEntity.error()
      : _statusCode = 400,
        _message = Strings.UNEXPECTED_ERROR;

  ResponseEntity.fromResponse(Response response) {
    if (response != null) {
      if (200 == response.statusCode) _data = response.data ?? Map();
      _statusCode = response.statusCode;
      _statusMessage = response.statusMessage;
      _message = _data['message'] ?? '';
    } else {
      _message = Strings.UNEXPECTED_ERROR;
      _statusCode = 400;
    }
  }

  String get statusMessage => _statusMessage;

  String get message => _message;

  bool isSucceed() => _statusCode == 200 && _data['data'] != null;

  bool containKey(String key) => _data.containsKey(key);

  Map getData() => _data['data'] ?? Map();

  int get statusCode => _statusCode;
}
