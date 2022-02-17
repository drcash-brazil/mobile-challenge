class ClinicResponseModel {
  List<ClinicDataResponseModel>? data;
  int? pageNumber;
  int? pageSize;
  int? totalElements;
  String? nextPage;
  int? totalActiveClinic;

  ClinicResponseModel(
      {this.data,
      this.pageNumber,
      this.pageSize,
      this.totalElements,
      this.nextPage,
      this.totalActiveClinic});

  ClinicResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ClinicDataResponseModel>[];
      json['data'].forEach((v) {
        data?.add(ClinicDataResponseModel.fromJson(v));
      });
    }
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    totalElements = json['totalElements'];
    nextPage = json['nextPage'];
    totalActiveClinic = json['totalActiveClinic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    data['totalElements'] = totalElements;
    data['nextPage'] = nextPage;
    data['totalActiveClinic'] = totalActiveClinic;
    return data;
  }
}

class ClinicDataResponseModel {
  int? id;
  String? tradingName;
  String? city;
  String? state;
  int? clinicTypeId;
  String? clinicType;
  String? phoneNumber;
  bool? isActive;

  ClinicDataResponseModel(
      {this.id,
      this.tradingName,
      this.city,
      this.state,
      this.clinicTypeId,
      this.clinicType,
      this.phoneNumber,
      this.isActive});

  ClinicDataResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tradingName = json['tradingName'];
    city = json['city'];
    state = json['state'];
    clinicTypeId = json['clinicTypeId'];
    clinicType = json['clinicType'];
    phoneNumber = json['phoneNumber'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tradingName'] = tradingName;
    data['city'] = city;
    data['state'] = state;
    data['clinicTypeId'] = clinicTypeId;
    data['clinicType'] = clinicType;
    data['phoneNumber'] = phoneNumber;
    data['isActive'] = isActive;
    return data;
  }
}
