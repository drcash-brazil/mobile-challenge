import 'package:dr_cash_clinic/storage/storage.dart';

class Token {
  static String? accessToken;
  static String? refreshToken;
  static String? tokenType;
  static int? expiresIn;

  static add(json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];

    Storage.saveToken(json);
  }

  static addStorageData(storage) {
    accessToken = storage.getString("access_token");
    refreshToken = storage.getString("refresh_token");
    tokenType = storage.getString("token_type");
    expiresIn = storage.getInt("expires_in");
  }

  static clean() {
    accessToken = null;
    refreshToken = null;
    tokenType = null;
    expiresIn = null;

    Storage.removeToken();
  }
}