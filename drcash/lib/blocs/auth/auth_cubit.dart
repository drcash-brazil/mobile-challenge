import 'package:drcash/blocs/auth/auth_state.dart';
import 'package:drcash/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  AuthCubit(this.repository) : super(AuthInitialState());

  login() {}

  logout() {}
}
