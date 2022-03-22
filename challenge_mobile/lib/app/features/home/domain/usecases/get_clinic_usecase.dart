import 'package:challenge_mobile/app/core/error/error.dart';
import 'package:challenge_mobile/app/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/params/clinic_params.dart';
import '../entities/clinic_entitry.dart';
import '../repositories/clinics_repository.dart';

class GetClinicUseCase extends UseCase<List<ClinicEntity>, ClinicParams> {
  final IClinicRepository _clinicRepository;

  GetClinicUseCase(this._clinicRepository);

  @override
  Future<Either<Failure, List<ClinicEntity>>> call(ClinicParams params) async {
    if (params.pageSize <= 0) {
      return Left(Failure(message: "PageSize inválido"));
    }
    if (params.pageNumber <= 0) {
      return Left(Failure(message: "PageNumber inválido"));
    }
    final result = await _clinicRepository.getClinics(params);
    return result;
  }
}
