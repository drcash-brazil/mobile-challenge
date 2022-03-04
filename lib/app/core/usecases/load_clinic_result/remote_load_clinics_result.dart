//TODO:

// import 'package:dr_cash_clinic/app/modules/clinics/models/remote_clinics_details_model.dart';
// import 'package:dr_cash_clinic/app/modules/clinics/usecases/load_clinics_details.dart';


// import '../../../helper/helpers.dart';
// import '../../entities/entities.dart';
// import '../../http/http.dart';


// class RemoteLoadClinicsResult implements LoadClinicsDetails {
//   final String url;
//   final HttpClient httpClient;

//   RemoteLoadClinicsResult({required this.url, required this.httpClient});

//   Future<ClinicDetailsEntity> loadByClinic({required String id}) async {
//     try {
//       final json = await httpClient.request(url: url, method: 'get');
//       return RemoteClinicsDetailsModel.fromJson(json).toString();
//     } on HttpError catch (error) {
//       throw error == HttpError.forbidden
//           ? DomainError.accessDenied
//           : DomainError.unexpected;
//     }
//   }
// }
