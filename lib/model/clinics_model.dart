class ClinicsDetails {
  int? id;
  String? tradingName;
  String? city;
  String? state;
  int? clinicTypeId;
  String? clinicType;
  String? phoneNumber;
  bool? isActive;

  ClinicsDetails.fromResponse(Map content) {
    this.id = content["id"];
    this.tradingName = content["tradingName"];
    this.city = content["city"];
    this.state = content["state"];
    this.clinicTypeId = content["clinicTypeId"];
    this.clinicType = content["clinicType"];
    this.phoneNumber = content["phoneNumber"];
    this.isActive = content["isActive"];
  }
}
