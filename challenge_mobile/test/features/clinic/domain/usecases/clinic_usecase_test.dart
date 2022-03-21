import 'package:challenge_mobile/app/core/error/error.dart';
import 'package:challenge_mobile/app/core/params/clinic_params.dart';
import 'package:challenge_mobile/app/features/clinics/domain/repositories/clinics_repository.dart';
import 'package:challenge_mobile/app/features/clinics/domain/usecases/get_clinic_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockIClinicRepository extends Mock implements IClinicRepository {}

void main() {
  MockIClinicRepository repository;
  GetClinicUseCase getClinicUseCase;

  setUp(() {
    repository = MockIClinicRepository();
    getClinicUseCase = GetClinicUseCase(repository);
  });
  final params = ClinicParams(
      city: "São Paulo",
      state: "SP",
      pageNumber: 0,
      pageSize: -4,
      orderBy: "name");
  test(
      "espero que retorne um erro se o tamanho da página for menor ou igual a zero",
      () async {
    when(repository.getClinics(params))
        .thenAnswer((_) async => Left(Failure(message: "PageSize inválido")));

    final result = await getClinicUseCase(params);

    expect(result, Left(Failure(message: "PageSize inválido")));
  });
  test("espero que retorne um erro se o tamanho da página for invalido",
      () async {
    when(repository.getClinics(params))
        .thenAnswer((_) async => Left(Failure(message: "PageSize inválido")));

    final result = await getClinicUseCase(params);

    expect(result, Left(Failure(message: "PageSize inválido")));
  });
}
