import 'package:mobile_challenge/modules/home/domain/repositories/i_home_repository.dart';
import 'package:mobile_challenge/modules/home/infra/datasources/i_home_datasource.dart';
import 'package:mobile_challenge/modules/login/domain/entities/clinic_entity.dart';

class HomeRepository implements IHomeRepository {
  final IHomeDatasource _datasource;
  HomeRepository(this._datasource);

  @override
  Future<List<ClinicEntity>> call(int pageNumber) async {
    return await _datasource(pageNumber);
  }
}
