import 'package:dio/dio.dart';
import 'package:mobile_challenge_drcash/services/clinics/clinics_exception.dart';
import 'package:mobile_challenge_drcash/services/clinics/clinics_response.dart';

class RequestClinicsQuery {
  int? pageNumber;

  RequestClinicsQuery({required this.pageNumber});

  Map<String, int> toMap() {
    return {"pageNumber": pageNumber ?? 1, "pageSize": 2};
  }
}

class ClinicsRepository {
  final Dio dio;

  ClinicsRepository({required this.dio});

  errorHandler(error) {
    throw ClinicsException.fromMap(error);
  }

  Future<ClinicsResponse> getClinics(
      {required RequestClinicsQuery params}) async {
    try {
      Map<String, int> data = params.toMap();
      Response<dynamic> response = await dio
          .get('${dio.options.baseUrl}/clinics/public', queryParameters: data);

      return ClinicsResponse.fromResponse(data: response.data);
    } on DioError catch (e) {
      return errorHandler(e.response?.data);
    }
  }
}
