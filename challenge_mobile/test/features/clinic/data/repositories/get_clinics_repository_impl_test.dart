import 'package:challenge_mobile/app/core/error/error.dart';
import 'package:challenge_mobile/app/core/params/clinic_params.dart';
import 'package:challenge_mobile/app/features/clinics/data/datasources/remote_get_clinics_datasource.dart';
import 'package:challenge_mobile/app/features/clinics/data/repositories/get_clinic_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class RemoteGetClinicDataSourceMock extends Mock
    implements RemoteGetClinicDataSource {}

void main() {
  RemoteGetClinicDataSourceMock remoteGetClinicDataSource;
  GetClinicRepositoryImpl getClinicRepositoryImpl;

  setUp(() {
    remoteGetClinicDataSource = RemoteGetClinicDataSourceMock();
    getClinicRepositoryImpl =
        GetClinicRepositoryImpl(remoteGetClinicDataSource);
  });

  test("deve retornar um erro se o dataSource falhar", () async {
    when(remoteGetClinicDataSource.getClinics(ClinicParams())).thenThrow(
        RemoteGetClinicsDataSourceError(
            "Ocorreu em erro ao chamar o RemoteGetClinicsDataSourceError"));
  });
}
