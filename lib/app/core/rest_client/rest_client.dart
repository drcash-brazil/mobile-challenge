import 'package:get/get_connect.dart';

class RestClient extends GetConnect {
  final _baseUrl = 'https://apihml.drcash.com.br/api/v1';

  RestClient() {
    httpClient.baseUrl = _baseUrl;
  }
}