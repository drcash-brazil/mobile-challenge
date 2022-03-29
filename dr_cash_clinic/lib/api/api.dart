import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';
import '../models/user.dart';
import 'config.dart';

class Api {

  var storage;

  Api({this.storage});

  Future<bool> Login(email, password) async {
    var url = Uri.parse(config.apiUrl + config.urlLogin);
    var body = json.encode({"email": email, "password": password});
    var response = await http.post(url, body: body, headers: _getHeaders());
    
    if(response.statusCode == 200) {
      User(storage: storage).setUser(json.decode(response.body));
      return true;

    } else {
      return false;
    } 
  }

  logout() {
    User(storage: storage).unsetUser();
    Get.toNamed('/');
  }

  Future<bool> validateToken() async {
    DateTime expiresIn = DateTime.fromMillisecondsSinceEpoch(storage.getInt("expires_in")! * 1000);
    if(expiresIn.isAfter(DateTime.now())) {
      return true;
    } else {
      logout();
      return false;
    }
  }

  _getHeaders() {
    return {
      "Content-Type": "application/json",
      "Connection": "keep-alive",
      //'Authorization': 'Bearer ${storage.getString("access_token")}'
    };
  }
}
