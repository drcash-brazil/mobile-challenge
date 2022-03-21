import 'package:challenge_mobile/app/core/error/error.dart';
import 'package:challenge_mobile/app/core/params/credential_params.dart';
import 'package:challenge_mobile/app/features/authentication/data/datasources/remote_authentication_datasource.dart';
import 'package:challenge_mobile/app/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class RemoteAuthenticationDataSourceMock extends Mock
    implements RemoteAuthenticationDataSource {}

void main() {
  RemoteAuthenticationDataSourceMock remoteAuthenticationDataSource;
  AuthenticationRepositoryImpl repositoryImpl;

  setUp(() {
    remoteAuthenticationDataSource = RemoteAuthenticationDataSourceMock();
    repositoryImpl =
        AuthenticationRepositoryImpl(remoteAuthenticationDataSource);
  });
  final credentialParams =
      CredentialsParams(email: "drcash@gmail.com", password: "12345678");

  test("deve retornar true se passar no login", () async {
    when(remoteAuthenticationDataSource.authenticate(credentialParams))
        .thenAnswer((_) async => true);

    final result = await repositoryImpl.authenticate(credentialParams);
    expect(result | null, true);
  });

  test("deve retornar um erro se o dataSource falhar", () async {
    when(remoteAuthenticationDataSource.authenticate(credentialParams))
        .thenThrow(RemoteAuthenticationDataSourceError(
            "Ocorreu em erro ao chamar o RemoteAuthenticationDataSource"));

    final result = await repositoryImpl.authenticate(credentialParams);
    expect(result.fold(id, id), isA<RemoteAuthenticationDataSourceError>());
  });
}
