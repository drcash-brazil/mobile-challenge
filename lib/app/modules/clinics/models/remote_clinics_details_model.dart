// import 'package:dr_cash_clinic/app/core/http/http.dart';

// import '../../../core/entities/entities.dart';

// class RemoteClinicsDetailsModel {
//   final int id;
//   final String tradingName;
//   final String? city;
//   final String? state;
//   final int? clinicTypeId;
//   final String? clinicType;
//   final String? phoneNumber;
//   final bool? isActive;

//   RemoteClinicsDetailsModel({
//     required this.id,
//     required this.tradingName,
//     this.city,
//     this.state,
//     this.clinicTypeId,
//     this.clinicType,
//     this.phoneNumber,
//     this.isActive,
//   });

//   factory RemoteClinicsDetailsModel.fromJson(Map<String, dynamic> json) {
//     if (!json.keys.toSet().containsAll([
//       'id',
//       'tradingName',
//       'city',
//       'state',
//       'clinicTypeId',
//       'clinicType',
//       'phoneNumber',
//     ])) {
//       throw HttpError.invalidData;
//     }
//     return RemoteClinicsDetailsModel(
//       id: json['id'] ?? 0,
//       tradingName: json['tradingName'] ?? '',
//       city: json['city'] ?? '',
//       state: json['state'] ?? '',
//       clinicTypeId: json['clinicTypeId'] ?? 0,
//       clinicType: json['clinicType'] ?? '',
//       phoneNumber: json['phoneNumber'] ?? '',
//       isActive: json['isActive'] ?? 'true',
//     );
//   }

//   ClinicDetailsEntity toEntity() => ClinicDetailsEntity(
//         id: id,
//         tradingName: tradingName,
//         city: city,
//         state: state,
//         clinicTypeId: clinicTypeId,
//         clinicType: clinicType,
//         phoneNumber: phoneNumber,
//         isActive: isActive,
//       );
// }

// To parse this JSON data, do
//
//     final RemoteClinicsDetailsModel = RemoteClinicsDetailsModelFromJson(jsonString);

import 'dart:convert';

RemoteClinicsDetailsModel RemoteClinicsDetailsModelFromJson(String str) =>
    RemoteClinicsDetailsModel.fromJson(json.decode(str));

String RemoteClinicsDetailsModelToJson(RemoteClinicsDetailsModel data) =>
    json.encode(data.toJson());

class RemoteClinicsDetailsModel {
  RemoteClinicsDetailsModel({
    required this.data,
    required this.pageNumber,
    required this.pageSize,
    required this.totalElements,
    required this.nextPage,
    required this.previousPage,
    required this.totalActiveClinic,
  });

  List<Datum> data;
  int pageNumber;
  int pageSize;
  int totalElements;
  String nextPage;
  dynamic previousPage;
  int totalActiveClinic;

  factory RemoteClinicsDetailsModel.fromJson(Map<String, dynamic> json) =>
      RemoteClinicsDetailsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pageNumber: json["pageNumber"] ?? 0,
        pageSize: json["pageSize"] ?? 0,
        totalElements: json["totalElements"] ?? 0,
        nextPage: json["nextPage"] ?? '',
        previousPage: json["previousPage"] ?? '',
        totalActiveClinic: json["totalActiveClinic"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "totalElements": totalElements,
        "nextPage": nextPage,
        "previousPage": previousPage,
        "totalActiveClinic": totalActiveClinic,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.tradingName,
    required this.city,
    required this.state,
    required this.clinicTypeId,
    required this.clinicType,
    required this.phoneNumber,
    required this.isActive,
  });

  int id;
  String tradingName;
  String city;
  String state;
  int clinicTypeId;
  String clinicType;
  String phoneNumber;
  bool isActive;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? 0,
        tradingName: json["tradingName"] ?? '',
        city: json["city"] ?? '',
        state: json["state"] ?? '',
        clinicTypeId: json["clinicTypeId"] ?? 0,
        clinicType: json["clinicType"] ?? '',
        phoneNumber: json["phoneNumber"] ?? '',
        isActive: json["isActive"] ?? true,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tradingName": tradingName,
        "city": city,
        "state": state,
        "clinicTypeId": clinicTypeId,
        "clinicType": clinicType,
        "phoneNumber": phoneNumber,
        "isActive": isActive,
      };
}
