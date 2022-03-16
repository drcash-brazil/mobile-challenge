import '../../../login/domain/entities/clinic_entity.dart';

abstract class IHomeDatasource {
  Future<List<ClinicEntity>> call(int pageNumber);
}
