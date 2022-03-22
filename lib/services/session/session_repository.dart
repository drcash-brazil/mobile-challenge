import 'package:dio/dio.dart';
import 'package:mobile_challenge_drcash/services/session/session_exception.dart';
import 'package:mobile_challenge_drcash/services/session/session_response.dart';

class RequestLoginBody {
  String email;
  String password;

  RequestLoginBody({required this.email, required this.password});
}

class SessionRepository {
  final Dio dio;

  SessionRepository({required this.dio});

  errorHandler(error) {
    throw SessionException.fromMap(error);
  }

  Future<SessionResponse> login({required RequestLoginBody body}) async {
    try {
      Response<dynamic> response = await dio.post(
          '${dio.options.baseUrl}/identity/token',
          data: {"email": body.email, "password": body.password});

      return SessionResponse.fromResponse(data: response.data);
    } on DioError catch (e) {
      return errorHandler(e.response?.data);
    }
  }
}
