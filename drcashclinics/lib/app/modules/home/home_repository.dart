import 'package:drcashclinics/app/core/data/api/api.dart';
import 'package:drcashclinics/app/core/data/http/http.dart';

abstract class HomeRepository {
  Future<dynamic> getClinics();
}

class HomeRepositoryImp implements HomeRepository {
  final HttpClient httpClient;
  HomeRepositoryImp(this.httpClient);

  @override
  Future<dynamic> getClinics() async {
    try {
      final httpResponse = await httpClient.request(
        Api.apiClinicsList,
        method: 'get',
      );

      return httpResponse;
    } catch (e) {
      return e;
    }
  }
}
