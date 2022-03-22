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
  static String getClinics(
      {int pageNumber = 1,
      int pageSize = 10,
      dynamic orderBy = "state",
      String? city,
      String? state}) {
    if (city != null && state != null) {
      return "clinics/public?pageNumber=$pageNumber&pageSize$pageSize&orderBy=$orderBy&city=$city&state=$state";
    } else {
      return "clinics/public?pageNumber=$pageNumber&pageSize=$pageSize&orderBy=$orderBy";
    }
  }

//----------------------------------------------------------------------------
}
