import 'package:challenge_mobile/app/core/error/error.dart';
import 'package:challenge_mobile/app/core/params/credential_params.dart';
import 'package:challenge_mobile/app/features/authentication/data/datasources/remote_authentication_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DrCashRemoteAuthDataSource extends ChangeNotifier
    implements RemoteAuthenticationDataSource {
  final Dio dio;
  String errorMessage = "";
  DrCashRemoteAuthDataSource(this.dio);
  @override
  Future<bool> authenticate(CredentialsParams params) async {
    try {
      final response = await dio.post(
        "https://apihml.drcash.com.br/api/v1/identity/token",
        data: {"email": params.email, "password": params.password},
      );

      if (response.statusCode == 200) {
        return true;
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        errorMessage = e.response.data["errors"].toString();
        notifyListeners();
        return false;
      }
    } catch (e) {
      throw Failure(message: "Erro ao realizar login");
    }

    return false;
  }
}
