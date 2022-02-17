class AuthResponseModel {
  String? accessToken;
  String? refreshToken;
  String? tokenType;
  int? expiresIn;
  List<String>? errors;
  int? errorStatus;

  AuthResponseModel({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.expiresIn,
    this.errors,
    this.errorStatus,
  });

  AuthResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    if (json['errors'] != null) {
      errors = json['errors'].cast<String>();
    }
    errorStatus = json['errorStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    data['errors'] = errors;
    data['errorStatus'] = errorStatus;
    return data;
  }
}
