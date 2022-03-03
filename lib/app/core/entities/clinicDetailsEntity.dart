import 'package:equatable/equatable.dart';

class ClinicDetailsEntity extends Equatable {
  final int? id;
  final String? tradingName;
  final String? city;
  final String? state;
  final int? clinicTypeId;
  final String? clinicType;
  final String? phoneNumber;
  final bool? isActive;
  //final List<RemoteClinicsDetailsModel> data;

  List get props => [
        id,
        tradingName,
        city,
        state,
        clinicTypeId,
        clinicType,
        phoneNumber,
        isActive,
        //data
      ];

  ClinicDetailsEntity({
    this.id,
    this.tradingName,
    this.city,
    this.state,
    this.clinicTypeId,
    this.clinicType,
    this.phoneNumber,
    this.isActive,
    //required this.data,
  });
}
