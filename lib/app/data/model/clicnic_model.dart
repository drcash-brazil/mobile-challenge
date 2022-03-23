class ClinicModel {
  int? id;
  String? tradingName;
  String? city;
  String? state;
  int? clinicTypeId;
  String? clinicType;
  String? phoneNumber;
  bool? isAcative;

  ClinicModel({this.id, this.tradingName, this.city, this.state, this.clinicTypeId, this.clinicType, this.phoneNumber, this.isAcative});

  ClinicModel.fromJson(Map<String,dynamic> json) {
    id = json['id'];
    tradingName = json['trandingName'];
    city = json['city'];
    state = json['state'];
    clinicTypeId = json['clicnicTypeId'];
    phoneNumber = json['phoneNumber'];
    isAcative = json['isActive'];
  }

  Map<String,dynamic> toJson() {
    return {
      'id': id,
      'trandingName': tradingName,
      'city': city,
      'state': state,
      'clinicTypeId': clinicTypeId,
      'phoneNumber': phoneNumber,
      'isActive': isAcative
    };
  }
}