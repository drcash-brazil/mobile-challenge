import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceStorage {
  SharedPreferenceStorage._();
  static final SharedPreferenceStorage instance = SharedPreferenceStorage._();
  SharedPreferences? _prefs;

  Future<SharedPreferences?> get prefs async {
    if (_prefs != null) return _prefs;

    _prefs = await _init();
    return _prefs;
  }

  Future<SharedPreferences> _init() async {
    return await SharedPreferences.getInstance();
  }

  Future<String> getString(String key, [String? defValue]) async {
    final sp = await prefs;
    return sp?.getString(key) ?? defValue ?? "";
  }

  Future<bool> getBool(String key, [bool? defValue]) async {
    final sp = await prefs;
    return sp?.getBool(key) ?? defValue ?? true;
  }

  Future<bool> setString(String key, String value) async {
    final sp = await prefs;
    return sp?.setString(key, value) ?? Future.value(false);
  }

  Future<bool> setBool(String key, bool value) async {
    final sp = await prefs;
    return sp?.setBool(key, value) ?? Future.value(true);
  }

  Future<int> getInt(String key, [int? defValue]) async {
    final sp = await prefs;
    return sp?.getInt(key) ?? defValue ?? 0;
  }

  Future<bool> setInt(String key, int value) async {
    final sp = await prefs;
    return sp?.setInt(key, value) ?? Future.value(false);
  }

  Future<bool>? remove(String key) async {
    final sp = await prefs;
    return sp?.remove(key) ?? Future.value(false);
  }
}
