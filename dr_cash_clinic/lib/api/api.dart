import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';
import 'config.dart';

class Api {

  Future<bool> Login(email, password) async {
    var url = Uri.parse(config.apiUrl + config.urlLogin);
    var body = json.encode({"email": email, "password": password});
    var response = await http.post(url, body: body, headers: _getHeaders());
    
    if(response.statusCode == 200) {
      User().setUser(json.decode(response.body));
      return true;

    } else {
      return false;
    } 
  }

  _getHeaders() {
    return {
      "Content-Type": "application/json",
      "Connection": "keep-alive",
    };
  }
}
