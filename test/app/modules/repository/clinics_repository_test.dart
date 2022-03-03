import 'package:flutter_test/flutter_test.dart';
import 'package:dr_cash_clinic/app/modules/clinics/repository/clinics_repository.dart';

void main() {
  late ClinicsRepository repository;

  setUpAll(() {
    repository = ClinicsRepository();
  });
}
