import 'package:dr_cash_clinic/app/core/http/http.dart';

import '../../../core/entities/entities.dart';

class RemoteClinicsDetailsModel {
  final int id;
  final String tradingName;
  final String? city;
  final String? state;
  final int? clinicTypeId;
  final String? clinicType;
  final String? phoneNumber;
  final bool? isActive;

  RemoteClinicsDetailsModel({
    required this.id,
    required this.tradingName,
    this.city,
    this.state,
    this.clinicTypeId,
    this.clinicType,
    this.phoneNumber,
    this.isActive,
  });

  factory RemoteClinicsDetailsModel.fromJson(Map<String, dynamic> json) {
    if (!json.keys.toSet().containsAll([
      'id',
      'tradingName',
      'city',
      'state',
      'clinicTypeId',
      'clinicType',
      'phoneNumber',
    ])) {
      throw HttpError.invalidData;
    }
    return RemoteClinicsDetailsModel(
      id: json['id'] ?? 0,
      tradingName: json['tradingName'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      clinicTypeId: json['clinicTypeId'] ?? 0,
      clinicType: json['clinicType'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      isActive: json['isActive'] ?? 'true',
    );
  }

  ClinicDetailsEntity toEntity() => ClinicDetailsEntity(
        id: id,
        tradingName: tradingName,
        city: city,
        state: state,
        clinicTypeId: clinicTypeId,
        clinicType: clinicType,
        phoneNumber: phoneNumber,
        isActive: isActive,
      );
}
