import 'package:mobile_challenge_drcash/services/session/session_repository.dart';
import 'package:mobile_challenge_drcash/services/session/session_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  static SessionService? _singleton;
  static get instance => _singleton;

  final SessionRepository sessionRepository;

  SessionService({required this.sessionRepository}) {
    if (_singleton == null) {
      _singleton = this;
    } else {
      throw Exception(
          "SessionService already created. Use SessionService.instance instead.");
    }
  }

  Future<String> login({required email, required password}) async {
    SessionResponse response = await sessionRepository.login(
        body: RequestLoginBody(email: email, password: password));

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(
        'access_token', '${response.tokenType} ${response.accessToken}');
    prefs.setString('refresh_token', response.refreshToken);

    return "Login Successfully";
  }

  void saveCredential({required email, required password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email-login', email);
    prefs.setString('password-login', password);
  }

  Future<CredentialSaved> getSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String email = prefs.getString('email-login') ?? "";
    String passsword = prefs.getString('password-login') ?? "";

    Map data = {"email": email, "password": passsword};
    return CredentialSaved.fromResponse(data: data);
  }
}
