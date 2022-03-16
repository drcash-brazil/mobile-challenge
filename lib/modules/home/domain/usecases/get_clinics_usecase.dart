import 'package:mobile_challenge/modules/home/domain/repositories/i_home_repository.dart';
import 'package:mobile_challenge/modules/login/domain/entities/clinic_entity.dart';

class GetClinicsUsecase {
  final IHomeRepository _repository;
  GetClinicsUsecase(this._repository);

  Future<List<ClinicEntity>> call(int pageNumber) async {
    return await _repository(pageNumber);
  }
}
