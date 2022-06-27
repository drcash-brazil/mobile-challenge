class HomeModel {
  int? id;
  String? tradingName;
  String? city;
  String? state;
  int? clinicTypeId;
  String? clinicType;
  bool? isActive;

  HomeModel({
    this.id,
    this.tradingName,
    this.city,
    this.state,
    this.clinicTypeId,
    this.clinicType,
    this.isActive,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'],
      tradingName: json['tradingName'],
      city: json['city'],
      state: json['state'],
      clinicTypeId: json['clinicTypeId'],
      clinicType: json['clinicType'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toMap(HomeModel homeModel) {
    return {
      'id': id,
      'tradingName': tradingName,
      'city': city,
      'state': state,
      'clinicTypeId': clinicTypeId,
      'clinicType': clinicType,
      'isActive': isActive,
    };
  }
}
