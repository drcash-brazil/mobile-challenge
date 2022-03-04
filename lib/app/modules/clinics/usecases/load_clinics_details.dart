import 'package:dr_cash_clinic/app/core/entities/clinicDetailsEntity.dart';

abstract class LoadClinicsDetails {
  Future<ClinicDetailsEntity> loadByClinic({required String id});
}
