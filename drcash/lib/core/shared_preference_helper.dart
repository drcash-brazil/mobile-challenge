import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'preferences.dart';

class SharedPreferenceHelper {
  final SharedPreferences _sharedPreference;

  SharedPreferenceHelper(this._sharedPreference);

  Future<String?> get authToken async {
    return _sharedPreference.getString(Preferences.AUTH_TOKEN);
  }

  Future<bool> saveAuthToken(String authToken) async {
    return _sharedPreference.setString(Preferences.AUTH_TOKEN, authToken);
  }

  Future<bool> removeAuthToken() async {
    return _sharedPreference.remove(Preferences.AUTH_TOKEN);
  }

  Future<bool> get isLoggedIn async {
    return _sharedPreference.getBool(Preferences.IS_LOGGED_IN) ?? false;
  }

  Future<bool> saveIsLoggedIn(bool value) async {
    return _sharedPreference.setBool(Preferences.IS_LOGGED_IN, value);
  }
}
