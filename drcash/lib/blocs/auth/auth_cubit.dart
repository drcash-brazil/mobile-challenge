import 'package:drcash/blocs/auth/auth_state.dart';
import 'package:drcash/core/shared_preference_helper.dart';
import 'package:drcash/models/auth_model.dart';
import 'package:drcash/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  AuthCubit(this.repository) : super(AuthInitialState());

  login(String email, String password) async {
    try {
      emit(AuthLoadingState());
      Auth response = await repository.login(email, password);
      _setAuthToken(response.accessToken!);
      emit(AuthLoadedState(response));
    } catch (e) {
      emit(AuthErrorState(e));
    }
  }

  logout() {
    _removeAuthToken();
    emit(AuthInitialState());
  }

  _setAuthToken(String authToken) async {
    var prefs = await SharedPreferences.getInstance();
    SharedPreferenceHelper(prefs).saveAuthToken(authToken);
    SharedPreferenceHelper(prefs).saveIsLoggedIn(true);
    SharedPreferenceHelper(prefs).isLoggedIn;
  }

  _removeAuthToken() async {
    var prefs = await SharedPreferences.getInstance();
    SharedPreferenceHelper(prefs).removeAuthToken();
    SharedPreferenceHelper(prefs).saveIsLoggedIn(false);
  }
}
