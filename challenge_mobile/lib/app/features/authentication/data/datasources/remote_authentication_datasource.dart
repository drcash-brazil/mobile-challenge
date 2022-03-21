import '../../../../core/params/credential_params.dart';

abstract class RemoteAuthenticationDataSource {
  /// chamar a url de autenticação :  https://apihml.drcash.com.br/api/v1/identity/token
  ///
  /// e retornar uma uma [ServerException] caso ocorra algum erro

  Future<bool> authenticate(CredentialsParams params);
}
