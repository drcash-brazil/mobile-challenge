import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_challenge_drcash/pages/login/bloc/login_event.dart';
import 'package:mobile_challenge_drcash/pages/login/bloc/login_state.dart';
import 'package:mobile_challenge_drcash/services/session/session_exception.dart';
import 'package:mobile_challenge_drcash/services/session/session_response.dart';
import 'package:mobile_challenge_drcash/services/session/session_services.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SessionService sessionService;

  LoginBloc({required this.sessionService}) : super(LoginState()) {
    on<UpdateEmailEvent>((event, emit) => _setEmailvalue(event, emit));
    on<UpdatePasswordEvent>((event, emit) => _setPasswordvalue(event, emit));
    on<UpdateSaveDataEvent>(((event, emit) => _setSaveDatavalue(event, emit)));
    on<SubmitLoginEvent>((event, emit) => _submitLoginForm(event, emit));
    on<LoadOnInitEvent>((event, emit) => _loadOnInit(event, emit));

    add(LoadOnInitEvent());
  }

  void _loadOnInit(LoadOnInitEvent event, Emitter<LoginState> emit) async {
    CredentialSaved credentials = await sessionService.getSavedCredentials();
    if (credentials.email != "" && credentials.password != "") {
      emit(LoginState(
          email: credentials.email,
          password: credentials.password,
          saveData: true));
    } else {
      emit(state.copyWith(email: state.email, password: state.password));
    }
  }

  void _setEmailvalue(UpdateEmailEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _setSaveDatavalue(UpdateSaveDataEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(saveData: event.save));
  }

  void _setPasswordvalue(UpdatePasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _submitLoginForm(
      SubmitLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoadingState(
        email: state.email,
        password: state.password,
        saveData: state.saveData));
    try {
      String message = await sessionService.login(
          email: state.email, password: state.password);

      if (state.saveData!) {
        sessionService.saveCredential(
            email: state.email, password: state.password);
      }

      emit(SuccessState(
          email: state.email,
          password: state.password,
          saveData: state.saveData,
          successMessage: message));
    } on SessionException catch (e) {
      emit(ErrorState(
          email: state.email,
          password: state.password,
          saveData: state.saveData,
          errorMessage: e.errorMessage));
    } catch (e) {
      emit(ErrorState(
          email: state.email,
          password: state.password,
          saveData: state.saveData,
          errorMessage: "Unexpected error, try later..."));
    }
  }
}
