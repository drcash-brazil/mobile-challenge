import 'package:dio/dio.dart';
import 'package:drcash/core/endpoints.dart';
import 'package:drcash/models/auth_model.dart';

import 'auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final Dio _dio;
  AuthRepository(this._dio);

  @override
  Future<Auth> login(String email, String password) async {
    AuthRequest authRequest = AuthRequest(email: email, password: password);
    var response = await _dio.post(Endpoints.login, data: authRequest);
    return Auth.fromJson(response.data);
  }
}
