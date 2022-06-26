import 'package:drcash/models/auth_model.dart';

abstract class IAuthRepository {
  Future<Auth> login(String email, String password);
}
