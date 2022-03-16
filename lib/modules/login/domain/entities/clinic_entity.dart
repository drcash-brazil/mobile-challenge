class ClinicEntity {
  int? id;
  String? tradingName;
  String? city;
  String? state;
  int? clinicTypeId;
  String? clinicType;
  String? phoneNumber;
  bool isActive;

  ClinicEntity({
    this.id,
    this.tradingName,
    this.city,
    this.state,
    this.clinicTypeId,
    this.clinicType,
    this.phoneNumber,
    this.isActive = true,
  });
}
