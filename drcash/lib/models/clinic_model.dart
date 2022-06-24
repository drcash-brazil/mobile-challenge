class ClinicResponse {
  List<Clinic>? data;
  int? pageNumber;
  int? pageSize;
  int? totalElements;
  String? nextPage;
  String? previousPage;
  int? totalActiveClinic;

  ClinicResponse({
    this.data,
    this.pageNumber,
    this.pageSize,
    this.totalElements,
    this.nextPage,
    this.previousPage,
    this.totalActiveClinic,
  });

  ClinicResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Clinic>[];
      json['data'].forEach((v) {
        data!.add(Clinic.fromJson(v));
      });
    }
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    totalElements = json['totalElements'];
    nextPage = json['nextPage'];
    previousPage = json['previousPage'];
    totalActiveClinic = json['totalActiveClinic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    data['totalElements'] = this.totalElements;
    data['nextPage'] = this.nextPage;
    data['previousPage'] = this.previousPage;
    data['totalActiveClinic'] = this.totalActiveClinic;
    return data;
  }
}

class Clinic {
  int? id;
  String? tradingName;
  String? city;
  String? state;
  int? clinicTypeId;
  String? clinicType;
  bool? isActive;

  Clinic({
    this.id,
    this.tradingName,
    this.city,
    this.state,
    this.clinicTypeId,
    this.clinicType,
    this.isActive,
  });

  Clinic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tradingName = json['tradingName'];
    city = json['city'];
    state = json['state'];
    clinicTypeId = json['clinicTypeId'];
    clinicType = json['clinicType'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tradingName'] = this.tradingName;
    data['city'] = this.city;
    data['state'] = this.state;
    data['clinicTypeId'] = this.clinicTypeId;
    data['clinicType'] = this.clinicType;
    data['isActive'] = this.isActive;
    return data;
  }
}
