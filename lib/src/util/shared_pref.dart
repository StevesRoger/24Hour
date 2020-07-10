import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  // Singleton factory
  static final _instance = SharedPref._init();

  factory SharedPref() => _instance;

  SharedPref._init();

  Future<Map<String, Object>> read(String key) async {
    return json.decode(await getString(key));
  }

  Future<bool> save(String key, Object value) async {
    return setString(key, json.encode(value));
  }

  Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.remove(key);
  }

  Future<bool> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<bool> containKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}

final sharedPre = SharedPref();
