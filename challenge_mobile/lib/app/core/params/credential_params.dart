import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class CredentialsParams extends Equatable {
  final String email;
  final String password;
  const CredentialsParams({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}
