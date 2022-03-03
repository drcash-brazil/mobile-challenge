import '../../domain/entities/entities.dart';
import '../http/http.dart';
import './models.dart';

class RemoteClinicResultModel {
  final List<RemoteClinicsDetailsModel> data;
  final int pageNumber;
  final int pageSize;
  final int totalElements;
  final int nextPage;
  final int previousPage;
  final int totalActiveClinic;

  RemoteClinicResultModel({
    required this.data,
    required this.pageNumber,
    required this.pageSize,
    required this.totalElements,
    required this.nextPage,
    required this.previousPage,
    required this.totalActiveClinic,
  });

  factory RemoteClinicResultModel.fromJson(Map<String, dynamic> json) {
    if (!json.keys.toSet().containsAll([
      'data',
      'pageNumber',
      'pageSize',
      'totalElements',
      'nextPage',
      'previousPage',
      'totalActiveClinic'
    ])) {
      throw HttpError.invalidData;
    }
    return RemoteClinicResultModel(
      data: json['data'] as List<RemoteClinicsDetailsModel>,
      pageNumber: json['pageNumber'] as int,
      pageSize: json['pageSize'] as int,
      totalElements: json['totalElements'] as int,
      nextPage: json['nextPage'] as int,
      previousPage: json['previousPage'] as int,
      totalActiveClinic: json['totalActiveClinic']
          .map<RemoteClinicsDetailsModel>(
              (dataJson) => RemoteClinicsDetailsModel.fromJson(dataJson))
          .toList(),
    );
  }

  ClinicResultEntity toEntity() => ClinicResultEntity(
        pageNumber: pageNumber,
        pageSize: pageSize,
        totalActiveClinic: totalActiveClinic,
        nextPage: nextPage,
        previousPage: previousPage,
        //data: data.map<ClinicDetailsEntity>((data) => data.toEntity()).toList(),
      );
}
