import 'package:dio/dio.dart';
import 'package:mobile_challenge/modules/login/domain/exception/login_exception.dart';

class LoginDatasource {
  final Dio dio;
  LoginDatasource(this.dio);

  Future<bool> call(String email, String password) async {
    try {
      final response = await dio.post(
        'https://apihml.drcash.com.br/api/v1/identity/token',
        data: {'email': email, 'password': password},
      );
      return response.statusCode == 200 ? true : false;
    } catch (e) {
      throw LoginException();
    }
  }
}
