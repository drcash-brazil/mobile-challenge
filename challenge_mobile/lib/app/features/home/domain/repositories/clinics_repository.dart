import 'package:challenge_mobile/app/core/error/error.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/params/clinic_params.dart';
import '../entities/clinic_entitry.dart';

abstract class IClinicRepository {
  Future<Either<Failure, List<ClinicEntity>>> getClinics(ClinicParams params);
}
