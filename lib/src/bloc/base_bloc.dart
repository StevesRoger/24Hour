import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc {
  final BehaviorSubject<dynamic> _streamController = BehaviorSubject<dynamic>();
  BuildContext _context;

  BaseBloc(BuildContext context) {
    this._context = context;
  }

  void add(dynamic event) {
    _streamController?.add(event);
  }

  Stream<dynamic> get stream => _streamController?.stream;

  BuildContext get context => _context;

  void init() {}

  void dispose() {
    _streamController?.close();
  }
}
