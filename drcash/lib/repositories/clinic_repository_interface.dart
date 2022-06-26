import 'package:drcash/models/clinic_model.dart';

abstract class IClinicRepository {
  Future<ClinicResponse?> getList(int page);
}
