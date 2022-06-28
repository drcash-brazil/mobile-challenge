// To parse this JSON data, do
//
//     final clinicData = clinicDataFromMap(jsonString);

import 'dart:convert';

List<ClinicData> clinicDataFromMap(String str) => List<ClinicData>.from(json.decode(str).map((x) => ClinicData.fromJson(x)));

String clinicDataToMap(List<ClinicData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ClinicData {
    ClinicData({
        this.id,
        this.tradingName,
        this.city,
        this.state,
        this.clinicTypeId,
        this.clinicType,
        this.phoneNumber,
        this.isActive,
    });

    int? id;
    String? tradingName;
    String? city;
    String? state;
    int? clinicTypeId;
    String? clinicType;
    String? phoneNumber;
    bool? isActive;

    factory ClinicData.fromJson(Map<String, dynamic> json) => ClinicData(
        id: json["id"],
        tradingName: json["tradingName"],
        city: json["city"],
        state: json["state"],
        clinicTypeId: json["clinicTypeId"],
        clinicType: json["clinicType"],
        phoneNumber: json["phoneNumber"],
        isActive: json["isActive"],
    );

    Map<String, dynamic> toMap() => {
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
