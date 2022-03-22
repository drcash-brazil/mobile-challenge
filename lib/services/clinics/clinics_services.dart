import 'package:mobile_challenge_drcash/model/clinics_model.dart';
import 'package:mobile_challenge_drcash/services/clinics/clinics_repository.dart';
import 'package:mobile_challenge_drcash/services/clinics/clinics_response.dart';

class ClinicsService {
  static ClinicsService? _singleton;
  static get instance => _singleton;

  final ClinicsRepository clinicsRepository;

  ClinicsService({required this.clinicsRepository}) {
    if (_singleton == null) {
      _singleton = this;
    } else {
      throw Exception(
          "ClinicsService already created. Use ClinicsService.instance instead.");
    }
  }

  Future<List<ClinicsDetails>> getClinics({required int page}) async {
    ClinicsResponse response = await clinicsRepository.getClinics(
        params: RequestClinicsQuery(pageNumber: page));

    List<ClinicsDetails> clinicsList = response.content!
        .map((clinics) => ClinicsDetails.fromResponse(clinics))
        .toList()
        .cast<ClinicsDetails>();

    return clinicsList;
  }
}
