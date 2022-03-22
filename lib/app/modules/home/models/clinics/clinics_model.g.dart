// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClinicsModel _$ClinicsModelFromJson(Map<String, dynamic> json) => ClinicsModel(
      id: json['id'] as int,
      tradingName: json['tradingName'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      clinicTypeId: json['clinicTypeId'] as int,
      clinicType: json['clinicType'] as String,
      phoneNumber: json['phoneNumber'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$ClinicsModelToJson(ClinicsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tradingName': instance.tradingName,
      'city': instance.city,
      'state': instance.state,
      'clinicTypeId': instance.clinicTypeId,
      'clinicType': instance.clinicType,
      'phoneNumber': instance.phoneNumber,
      'isActive': instance.isActive,
    };
