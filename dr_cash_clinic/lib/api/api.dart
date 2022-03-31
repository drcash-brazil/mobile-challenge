import 'package:dr_cash_clinic/models/clinic.dart';
import 'package:dr_cash_clinic/storage/storage.dart';
import 'package:dr_cash_clinic/models/token.dart';
import 'package:dr_cash_clinic/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'config.dart';
import 'dart:async';

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

  Future<List<Clinic>?> getClinics(addressState, clinicType) async {
    var url = Uri.parse(config.apiUrl + config.urlClinics).replace(queryParameters: {
      'state': addressState == "ALL" ? "" : addressState,
      'clinicTypeId': clinicType == 1 ? "" : clinicType.toString(),
    });
    var response = await http.get(url, headers: _getHeaders());

    if(response.statusCode == 200) {
      var data = json.decode(response.body)['data'] as List;  
      return data.map((item) => Clinic.fromJson(item)).toList();
    } else {
      return null;
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
