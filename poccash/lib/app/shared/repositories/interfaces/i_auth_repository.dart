import 'package:poccash/app/shared/models/response/auth_response_model.dart';

abstract class IAuthRepository {
  Future<AuthResponseModel> login(String userName, String pass);
  Future<AuthResponseModel> refreshToken();
}
