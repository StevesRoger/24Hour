import 'package:rxdart/rxdart.dart';

abstract class BaseBloc {
  BehaviorSubject _streamController = BehaviorSubject();

  void add(dynamic event) {
    _streamController?.add(event);
  }

  Stream<dynamic> get stream => _streamController?.stream;

  void init() {
    if (_streamController == null || _streamController.isClosed)
      _streamController = BehaviorSubject();
  }

  void dispose() {
    _streamController?.close();
  }
}
