class Clinic {
  int id;
  String tradingName;
  String city;
  String state;
  int clinicTypeId;
  String clinicType;
  String phoneNumber;
  bool isActive;

  Clinic({
    this.id,
    this.tradingName,
    this.city,
    this.state,
    this.clinicTypeId,
    this.clinicType,
    this.phoneNumber,
    this.isActive,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      id: json["id"],
      tradingName: json["tradingName"],
      city: json["city"],
      state: json["state"],
      clinicTypeId: json["clinicTypeId"],
      clinicType: json["clinicType"],
      phoneNumber: json["phoneNumber"],
      isActive: json["isActive"],
    );
  }
}
