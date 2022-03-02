import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user_model_repository.dart';

class LoginAuthRepository {
  Future<UserModelRepository> login(String email, String password) async {
    Map params = {"email": email, "password": password};

    var _body = json.encode(params);

    var user;

    final response = await http.post(
        Uri.parse('https://apihml.drcash.com.br/api/v1/identity/token'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: _body);

    print('body: ' + _body);

    Map<String, dynamic> mapResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      user = UserModelRepository.fromJson(mapResponse);

      print("user_model: $user");

      // return user;
    } else {
      user = null;
      // if (response.statusCode == 400) {
      //   //alert(context, 'user invalido');
      //   throw Exception('access failed');
      //}
    }
    return user;
  }
}
