class Endpoints {
  Endpoints._();

  static const String baseUrl = 'https://apihml.drcash.com.br/api/v1';
  static const String login = '$baseUrl/identity/token';
  static const String clinics = '$baseUrl/clinics/public';
}
