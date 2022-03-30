import 'package:dr_cash_clinic/storage/storage.dart';
import 'package:dr_cash_clinic/models/token.dart';
import 'package:dr_cash_clinic/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'config.dart';

class Api {

  Future<bool> getToken(email, password) async {

    var url = Uri.parse(config.apiUrl + config.urlLogin);
    var body = json.encode({"email": email, "password": password});
    var response = await http.post(url, body: body, headers: _getHeaders());
    
    if(response.statusCode == 200) {
      Token.add(json.decode(response.body));
      User.add(email);

      if(Storage.getRemember()) {
        Storage.saveCredentialsRemember(email, password);
      }

      Future.delayed(const Duration(seconds: 3), () {              
        User.login();              
      });
      return true;

    } else {
      return false;
    } 
  }

  validateToken() {
    DateTime expiresIn = DateTime.fromMillisecondsSinceEpoch(Token.expiresIn! * 1000);
    if(expiresIn.isAfter(DateTime.now())) {
      User.login();
    } else {
      User.logout();
    }
  }

  _getHeaders() {
    return {
      "Content-Type": "application/json",
      "Connection": "keep-alive",
      'Authorization': '${Token.tokenType} ${Token.accessToken}}'
    };
  }
}
