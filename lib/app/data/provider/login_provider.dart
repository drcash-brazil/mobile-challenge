import 'dart:developer';

import 'package:mobile_challenge/app/core/rest_client/api_response.dart';
import 'package:mobile_challenge/app/core/rest_client/rest_client.dart';
import 'package:mobile_challenge/app/data/model/user_model.dart';

class LoginProvider {
  final RestClient _restClient;

  LoginProvider({required RestClient restClient}): _restClient = restClient;

  Future<ApiResponse<UserModel>> login(String email, String password) async{
    Map<String, String> body = {
      'email': email,
      'password': password
    };
    try {
      final response = await _restClient.post('/identity/token', body);

      if(response.statusCode == 200) {
        UserModel userModel = UserModel.fromJson(response.body);
        return ApiResponse.ok(result: userModel);
      }
      return ApiResponse.error(msg: 'Erro ao autenticar o usuário');
    } catch(e) {
      log('Erro ao autenticar o usuário:  ${e}');
      
      return ApiResponse.error(msg: 'Erro ao autenticar o usuário');
    }
  }
}