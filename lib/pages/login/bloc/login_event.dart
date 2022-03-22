class LoginEvent {}

class UpdateEmailEvent extends LoginEvent {
  String email;

  UpdateEmailEvent({required this.email});
}

class UpdatePasswordEvent extends LoginEvent {
  String password;

  UpdatePasswordEvent({required this.password});
}

class UpdateSaveDataEvent extends LoginEvent {
  bool save;

  UpdateSaveDataEvent({required this.save});
}

class SubmitLoginEvent extends LoginEvent {}

class LoadOnInitEvent extends LoginEvent {
  LoadOnInitEvent();
}
