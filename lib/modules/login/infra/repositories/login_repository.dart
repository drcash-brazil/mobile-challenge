import 'package:mobile_challenge/modules/login/external/datasources/login_datasource.dart';

import '../../domain/repositories/i_login_repository.dart';

class LoginRepository implements ILoginRepository {
  final LoginDatasource _datasource;
  LoginRepository(this._datasource);

  @override
  Future call(String email, String password) async {
    return await _datasource(email, password);
  }
}
