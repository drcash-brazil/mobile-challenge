import 'package:challenge_mobile/app/core/params/credential_params.dart';
import 'package:challenge_mobile/app/core/error/error.dart';
import 'package:challenge_mobile/app/features/authentication/data/datasources/remote_authentication_datasource.dart';
import 'package:challenge_mobile/app/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationRepositoryImpl extends ChangeNotifier
    implements IAuthenticationRepository {
  final RemoteAuthenticationDataSource remoteAuthenticationDataSource;
  AuthenticationRepositoryImpl(this.remoteAuthenticationDataSource);

  @override
  Future<Either<Failure, bool>> authenticate(CredentialsParams params) async {
    try {
      final result = await remoteAuthenticationDataSource.authenticate(params);

      return Right(result);
    } catch (e) {
      return Left(RemoteAuthenticationDataSourceError(
          "Ocorreu em erro ao chamar o RemoteAuthenticationDataSource"));
    }
  }
}
