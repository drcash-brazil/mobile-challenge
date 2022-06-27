import 'package:drcash/models/auth_model.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class AuthState {
  final Auth? auth;
  final dynamic error;
  AuthState({required this.auth, this.error});
}

class AuthInitialState extends AuthState {
  AuthInitialState() : super(auth: null, error: null);
}

class AuthLoadingState extends AuthState {
  AuthLoadingState() : super(auth: null);
}

class AuthLoadedState extends AuthState {
  AuthLoadedState(Auth auth) : super(auth: auth, error: null);
}

class AuthErrorState extends AuthState {
  AuthErrorState(dynamic error) : super(auth: null, error: error);
}
