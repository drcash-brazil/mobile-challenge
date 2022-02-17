import 'package:dio/dio.dart';
import 'package:poccash/app/shared/core/constants/constants.dart';
import 'package:poccash/app/shared/models/response/auth_response_model.dart';
import 'package:poccash/app/shared/repositories/interfaces/i_auth_repository.dart';
import 'package:poccash/app/shared/webclient/webclient.dart';

class AuthRepository implements IAuthRepository {
  final WebClient? _client;

  AuthRepository(this._client);

  @override
  Future<AuthResponseModel> login(String userName, String pass) async {
    try {
      var data = {"email": userName, "password": pass};
      Response<dynamic> response = await _client!.post(urlAuth, data: data);

      return AuthResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.message);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthResponseModel> refreshToken() async {
    try {
      Response<dynamic> response = await _client!.post(urlAuthRrefreshToken);

      return AuthResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.message);
    } catch (e) {
      rethrow;
    }
  }
}
