import 'package:drcash/models/clinic_model.dart';

abstract class IClinicRepository {
  Future<List<Clinic>> getList(int page);
}
