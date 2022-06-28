import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/user_data.dart';

class SigninDTO extends ChangeNotifier{
  Future<UserData> signin(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://apihml.drcash.com.br/api/v1/identity/token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      print(response.body);
      return UserData.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Failed to load cliente');
    }
  }
}
