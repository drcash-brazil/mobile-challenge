import 'package:mobile_challenge/modules/login/domain/entities/clinic_entity.dart';

extension ClinicDto on ClinicEntity {
  static ClinicEntity fromJson(Map<String, dynamic> json) {
    return ClinicEntity(
      id: json['id'],
      tradingName: json['tradingName'],
      city: json['city'],
      state: json['state'],
      clinicTypeId: json['clinicTypeId'],
      clinicType: json['clinicType'],
      phoneNumber: json['phoneNumber'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tradingName'] = tradingName;
    data['city'] = city;
    data['state'] = state;
    data['clinicTypeId'] = clinicTypeId;
    data['clinicType'] = clinicType;
    data['phoneNumber'] = phoneNumber;
    data['isActive'] = isActive;
    return data;
  }
}
