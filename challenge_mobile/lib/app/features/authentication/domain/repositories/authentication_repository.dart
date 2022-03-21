import 'package:challenge_mobile/app/core/error/error.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/params/credential_params.dart';

abstract class IAuthenticationRepository {
  Future<Either<Failure, bool>> authenticate(CredentialsParams params);
}
