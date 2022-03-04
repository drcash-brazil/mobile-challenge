//TODO: 

// import '../../../domain/entities/entities.dart';
// import '../../../domain/helpers/helpers.dart';
// import '../../../domain/usecases/load_clinics.dart';
// import '../../http/http.dart';
// import '../../models/models.dart';

// class RemoteLoadClinics implements LoadClinics {
//   late final String url;
//   late final HttpClient httpClient;

//   RemoteLoadClinics({required this.url, required this.httpClient});

//   Future<List<ClinicResultEntity>> load() async {
//     try {
//       final httpResponse = await httpClient.request(url: url, method: 'get');
//       //final httpResponse = await httpClient.request(url: url, method: 'get');
//       //https://apihml.drcash.com.br/api/v1/clinics/public
//       return httpResponse
//           .map<ClinicResultEntity>(
//               (json) => RemoteClinicResultModel.fromJson(json).toEntity())
//           .toList();
//     } on HttpError catch (error) {
//       throw error == HttpError.forbidden
//           ? DomainError.accessDenied
//           : DomainError.unexpected;
//     }
//   }
// }
