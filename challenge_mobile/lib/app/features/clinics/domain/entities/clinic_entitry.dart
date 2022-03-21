import 'package:equatable/equatable.dart';

class ClinicEntity extends Equatable {
  final int id;
  final String tradingName;
  final String state;
  final String city;
  final int clinicTypeId;
  final String clinicType;
  final String phoneNumber;
  final bool isActive;

  const ClinicEntity(
      {this.id,
      this.tradingName,
      this.state,
      this.city,
      this.clinicTypeId,
      this.clinicType,
      this.phoneNumber,
      this.isActive});

  @override
  List<Object> get props => [
        id,
        tradingName,
        state,
        city,
        clinicTypeId,
        clinicType,
        phoneNumber,
        isActive
      ];
}
