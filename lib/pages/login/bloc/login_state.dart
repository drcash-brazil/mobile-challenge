class LoginState {
  final String? email;
  final String? password;
  final bool? saveData;
  LoginState({this.email, this.password, this.saveData = true});

  LoginState copyWith({String? email, String? password, bool? saveData}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        saveData: saveData ?? this.saveData);
  }
}

class LoadingState extends LoginState {
  LoadingState({String? email, String? password, bool? saveData})
      : super(email: email, password: password, saveData: saveData);
}

class ErrorState extends LoginState {
  final String? errorMessage;

  ErrorState(
      {String? email, String? password, bool? saveData, this.errorMessage})
      : super(email: email, password: password, saveData: saveData);
}

class SuccessState extends LoginState {
  final String? successMessage;

  SuccessState(
      {String? email, String? password, bool? saveData, this.successMessage})
      : super(email: email, password: password, saveData: saveData);
}
