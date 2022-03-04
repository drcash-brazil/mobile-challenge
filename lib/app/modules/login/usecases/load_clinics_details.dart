import '../entities/entities.dart';

abstract class LoadClinicsDetails {
  Future<ClinicDetailsEntity> loadByClinic({required String id});
}
