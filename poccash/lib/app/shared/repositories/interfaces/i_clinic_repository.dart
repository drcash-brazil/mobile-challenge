import 'package:poccash/app/shared/models/response/clinic_response_model.dart';

abstract class IClinicRepository {
  Future<ClinicResponseModel?> getClinics();
}
