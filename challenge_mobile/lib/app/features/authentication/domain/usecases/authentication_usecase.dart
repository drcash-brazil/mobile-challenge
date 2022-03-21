import 'package:dartz/dartz.dart';
import 'package:string_validator/string_validator.dart';
import '../../../../core/error/error.dart';
import '../../../../core/params/credential_params.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/authentication_repository.dart';

class AuthenticateUseCase extends UseCase<bool, CredentialsParams> {
  IAuthenticationRepository authenticationRepository;

  AuthenticateUseCase(this.authenticationRepository);

  @override
  Future<Either<Failure, bool>> call(CredentialsParams params) async {
    if (!isEmail(params.email)) {
      return Left(Failure(message: "Email inválido"));
    }
    if (params.password.isEmpty) {
      return Left(Failure(message: "Insira uma senha válida"));
    }
    if (params.password.length < 8) {
      return Left(Failure(message: "A senha deve ter 8 ou mais carateres"));
    }

    return await authenticationRepository.authenticate(params);
  }
}
