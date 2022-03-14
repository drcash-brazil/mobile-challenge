import 'dart:convert';

import 'package:drcash/base/base_url.dart';
import 'package:drcash/model/usuario.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<Usuario> login(Usuario usuario) async {
    final response = await http.post(
      Uri.parse(BaseURL.urlToken),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': usuario.email,
        'password': usuario.password,
      }),
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      return Usuario.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<void> salvarToken(Usuario usuario) async {
    print(usuario.expiresIn);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("acecessToken", usuario.acecessToken);
    prefs.setInt("expiresIn", usuario.expiresIn);
  }

  Future<bool> tokenValido() async {
    final prefs = await SharedPreferences.getInstance();
    var expiresIn = prefs.getInt("expiresIn");
    print("expiresIn $expiresIn");

    return expiresIn == null
        ? false
        : DateTime(expiresIn).isBefore(DateTime.now());
  }

  Future<void> logoff() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("acecessToken");
    prefs.remove("expiresIn");
  }
}
