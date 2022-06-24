import 'package:drcash/models/auth_model.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class AuthState {
  final Auth? auth;
  AuthState(this.auth);
}

class AuthInitialState extends AuthState {
  AuthInitialState() : super(null);
}

class AuthLoaded extends AuthState {
  AuthLoaded(Auth auth) : super(auth);
}
