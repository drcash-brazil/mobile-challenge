import 'dart:convert';

import '../../domain/entities/clinic_entitry.dart';

class ClinicModel extends ClinicEntity {
  @override
  final int id;
  final String tradingName;
  final String city;
  final String state;
  final int clinicTypeId;
  final String clinicType;
  final String phoneNumber;
  final bool isActive;

  const ClinicModel(
      {this.id,
      this.tradingName,
      this.city,
      this.state,
      this.clinicTypeId,
      this.clinicType,
      this.phoneNumber,
      this.isActive});
  factory ClinicModel.fromJson(Map<String, dynamic> json) {
    return ClinicModel(
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

  Map<String, dynamic> toMap() {
    return {
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
}
