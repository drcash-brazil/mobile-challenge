import 'package:challenge_mobile/app/core/error/error.dart';
import 'package:challenge_mobile/app/core/params/credential_params.dart';
import 'package:challenge_mobile/app/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:challenge_mobile/app/features/authentication/domain/usecases/authentication_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthenticationRepository extends Mock
    implements IAuthenticationRepository {}

void main() {
  MockAuthenticationRepository authenticationRepository;
  AuthenticateUseCase authenticationUseCase;

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
    authenticationUseCase = AuthenticateUseCase(authenticationRepository);
  });

  test("espero que retorne faça login se o email e a senha estiverem correctos",
      () async {
    final userCredentials =
        CredentialsParams(email: "drcash@gmail.com", password: "12345678");
    when(authenticationUseCase(userCredentials))
        .thenAnswer((realInvocation) async => Right(true));

    verifyNoMoreInteractions(authenticationRepository);
  });

  test("espero que retorne  um erro se email estiver incorreto", () async {
    final userCredentials =
        CredentialsParams(email: "drcash@gmail", password: "1234");

    final result = await authenticationUseCase(userCredentials);

    expect(result, Left(Failure(message: "Email inválido")));
  });

  test("espero que retorne  um erro se a senha estiver vazia", () async {
    final userCredentials =
        CredentialsParams(email: "drcash@gmail.com", password: "");

    final result = await authenticationUseCase(userCredentials);

    expect(result, Left(Failure(message: "Insira uma senha válida")));
  });
  test("espero que retorne  erro se  a senha conter menos de 8 caraters",
      () async {
    final userCredentials =
        CredentialsParams(email: "drcash@gmail.com", password: "123455");

    final result = await authenticationUseCase(userCredentials);

    expect(
        result, Left(Failure(message: "A senha deve ter 8 ou mais carateres")));
  });
}
