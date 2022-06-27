import 'dart:convert';

import 'package:drcashclinics/app/core/data/api/api.dart';
import 'package:drcashclinics/app/core/data/http/http.dart';
import 'package:drcashclinics/app/modules/login/login_model.dart';

abstract class LoginRepository {
  Future<dynamic> login({required LoginModel loginModel});
}

class LoginRepositoryImp implements LoginRepository {
  final HttpClient httpClient;
  LoginRepositoryImp(this.httpClient);

  @override
  Future<dynamic> login({required loginModel}) async {
    try {
      String body = jsonEncode({
        "email": loginModel.email,
        "password": loginModel.password,
      });

      final httpResponse = await httpClient.request(
        Api.apiUserLogin,
        method: 'post',
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: body,
      );

      return httpResponse;
    } catch (e) {
      return e;
    }
  }
}
