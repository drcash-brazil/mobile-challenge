import '../../../login/domain/entities/clinic_entity.dart';

abstract class IHomeRepository {
  Future<List<ClinicEntity>> call(int pageNumber);
}
