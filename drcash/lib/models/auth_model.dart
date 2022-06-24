class Auth {
  String? accessToken;
  String? refreshToken;
  String? tokenType;
  int? expiresIn;

  Auth({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.expiresIn,
  });

  Auth.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}
