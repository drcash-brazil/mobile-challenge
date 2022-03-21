import 'package:challenge_mobile/app/features/clinics/data/models/clinic_model.dart';
import 'package:challenge_mobile/app/features/clinics/domain/entities/clinic_entitry.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("espero que o modelo retorna uma instancia de ClinicEntity", () {
    expect(ClinicModel(), isA<ClinicEntity>());
  });
}