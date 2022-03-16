import 'package:mobile_challenge/modules/login/domain/repositories/i_login_repository.dart';

class LoginUsecase {
  final ILoginRepository _repository;
  LoginUsecase(this._repository);

  Future call(String email, String password) async {
    return await _repository(email, password);
  }
}
