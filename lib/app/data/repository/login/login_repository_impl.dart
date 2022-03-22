import 'package:mobile_challenge/app/data/provider/login_provider.dart';
import 'package:mobile_challenge/app/data/repository/login/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository{
  final LoginProvider _loginProvider; 

  LoginRepositoryImpl({required LoginProvider loginProvider}) : _loginProvider = loginProvider;

  login(String email, String password) {
    return _loginProvider.login(email, password);
  } 
}