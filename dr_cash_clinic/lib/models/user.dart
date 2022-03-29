import 'package:get/get.dart';

class User {
  String? accessToken;
  String? refreshToken;
  String? tokenType;
  int? expiresIn;
  var storage;

  User({
    this.accessToken, 
    this.refreshToken, 
    this.tokenType, 
    this.expiresIn,
    this.storage
  });

  setUser(json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];

    _setStorage();
  }

  unsetUser() {
    storage.remove("access_token");
    storage.remove("refresh_token");
    storage.remove("token_type");
    storage.remove("expires_in");
  }

  _setStorage() async {
    storage.setString("access_token", accessToken!);
    storage.setString("refresh_token", refreshToken!);
    storage.setString("token_type", tokenType!);
    storage.setInt("expires_in", expiresIn!);
  }
}