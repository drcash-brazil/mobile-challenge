class ApiRoutes {
  ApiRoutes._();

  static String get baseUrl => _productionBaseUrl;
  static const String _apiVersion = "v1";

//Homologation

//Production
  static const String _productionBaseUrl =
      "https://apihml.drcash.com.br/api/$_apiVersion";

//----------------------------------------------------------------------------

//LOGIN
  static const String authAuthenticate = "identity/token";

//----------------------------------------------------------------------------

//CLINICS
  static const String getClinics = "clinics/public";

//----------------------------------------------------------------------------
}
