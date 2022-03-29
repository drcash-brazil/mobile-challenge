import 'package:shared_preferences/shared_preferences.dart';

class User {
  String? accessToken;
  String? refreshToken;
  String? tokenType;
  int? expiresIn;

  User({
    this.accessToken, 
    this.refreshToken, 
    this.tokenType, 
    this.expiresIn
  });

  setUser(json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];

    _setStorage();
  }

  _setStorage() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    storage.setString("access_token", accessToken!);
    storage.setString("refresh_token", refreshToken!);
    storage.setString("token_type", tokenType!);
    storage.setInt("expires_in", expiresIn!);
  }
}