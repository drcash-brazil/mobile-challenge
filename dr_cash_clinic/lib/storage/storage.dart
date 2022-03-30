import 'package:dr_cash_clinic/models/token.dart';
import 'package:dr_cash_clinic/models/user.dart';

class Storage {

  static var _storage;

  static setInstance(instance) {
    _storage = instance;

    if(_storage.containsKey("access_token")) {
      Token.addStorageData(_storage);
      User.addStorageData(_storage);
    }
  }

  static saveToken(json) {
    _storage.setString("access_token",  json['access_token']);
    _storage.setString("refresh_token", json['refresh_token']);
    _storage.setString("token_type", json['token_type']);
    _storage.setInt("expires_in", json['expires_in']);
  }

  static removeToken() {
    _storage.remove("access_token");
    _storage.remove("refresh_token");
    _storage.remove("token_type");
    _storage.remove("expires_in");
  }

  static saveUser(email) {
    _storage.setString("email", email);
  }

  static removeUser() {
    _storage.remove("email");
  }

  static getRemember() {
    if(_storage.containsKey("remember")) {
      return _storage.getBool("remember");
    } else {
      return false;
    }
  }

  static saveRemember(status) {
    _storage.setBool("remember", status);

    if(!status) {
      removeCredentialsRemember();
    }
  }

  static saveCredentialsRemember(email, password) {
    _storage.setString("rememberEmail", email);
    _storage.setString("rememberPassword", password);
  }

  static removeCredentialsRemember() {
    _storage.remove("rememberEmail");
    _storage.remove("rememberPassword");
  }

  static getEmailRemember() {
    if(_storage.containsKey("rememberEmail")) {
      return _storage.getString("rememberEmail");
    } else {
      return "";
    }
  }

  static getPasswordRemember() {
    if(_storage.containsKey("rememberPassword")) {
      return _storage.getString("rememberPassword");
    } else {
      return "";
    }
  }
}