import 'package:mobile_challenge/app/data/provider/clinics_provider.dart';
import 'package:mobile_challenge/app/data/repository/clinics/clinics_repository.dart';

class ClinicsRepositoryImpl extends ClinicsRepository {
  ClinicsProvider _clinicsProvider;

  ClinicsRepositoryImpl({required ClinicsProvider clinicsProvider}) : _clinicsProvider = clinicsProvider;

  @override
  getClinics() {
    return _clinicsProvider.getClinics();
  }

}