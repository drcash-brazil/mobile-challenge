import 'package:json_annotation/json_annotation.dart';

part 'clinics_model.g.dart';

@JsonSerializable()
class ClinicsModel {
  final int id;
  final String tradingName;
  final String city;
  final String state;
  final int clinicTypeId;
  final String clinicType;
  final String phoneNumber;
  final bool isActive;

  ClinicsModel({
    required this.id,
    required this.tradingName,
    required this.city,
    required this.state,
    required this.clinicTypeId,
    required this.clinicType,
    required this.phoneNumber,
    required this.isActive,
  });

  factory ClinicsModel.fromJson(Map<String, dynamic> json) =>
      _$ClinicsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClinicsModelToJson(this);
}
