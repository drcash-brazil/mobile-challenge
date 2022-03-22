import '../../../../core/models/api_response.model.dart';


abstract class IClinicsRepository {
  Future<ApiResponseModel?> getAllClinics({
    required context,
  });
}
