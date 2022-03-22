import '../../../../core/params/clinic_params.dart';
import '../../domain/entities/clinic_entitry.dart';

abstract class RemoteGetClinicDataSource {
  /// chamar a url de autenticação :  https://apihml.drcash.com.br/api/v1/clinics
  ///
  /// e retornar uma uma [ServerException] caso ocorra algum erro}
  Future<List<ClinicEntity>> getClinics(ClinicParams params);
}
