import 'package:rxdart/rxdart.dart';

abstract class BaseBloc {
  final BehaviorSubject<dynamic> _streamController = BehaviorSubject<dynamic>();

  void add(dynamic event) {
    _streamController?.add(event);
  }

  Stream<dynamic> get stream => _streamController?.stream;

  void init() {}

  void dispose() {
    _streamController?.close();
  }
}
