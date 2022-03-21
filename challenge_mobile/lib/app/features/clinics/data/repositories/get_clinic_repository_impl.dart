import 'package:challenge_mobile/app/features/clinics/data/datasources/remote_get_clinics_datasource.dart';
import 'package:challenge_mobile/app/features/clinics/domain/entities/clinic_entitry.dart';
import 'package:challenge_mobile/app/core/params/clinic_params.dart';
import 'package:challenge_mobile/app/core/error/error.dart';
import 'package:challenge_mobile/app/features/clinics/domain/repositories/clinics_repository.dart';
import 'package:dartz/dartz.dart';

class GetClinicRepositoryImpl implements IClinicRepository {
  RemoteGetClinicDataSource remoteGetClinicDataSource;

  GetClinicRepositoryImpl(this.remoteGetClinicDataSource);
  @override
  Future<Either<Failure, List<ClinicEntity>>> getClinics(
      ClinicParams params) async {
    try {
      final result = await remoteGetClinicDataSource.getClinics(params);
      return Right(result);
    } catch (e) {
      return Left(RemoteGetClinicsDataSourceError(
          "Ocorreu em erro ao chamar o RemoteGetClinicDataSource"));
    }
  }
}
