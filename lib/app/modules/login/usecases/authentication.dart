import 'package:dr_cash_clinic/app/core/entities/account_entity.dart';

import 'package:equatable/equatable.dart';

abstract class Authentication {
  Future<AccountEntity> auth(AuthenticationParams params);
}

class AuthenticationParams extends Equatable {
  final String email;
  final String secret;

  List get props => [email, secret];

  AuthenticationParams({required this.email, required this.secret});
}
