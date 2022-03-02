// ignore_for_file: unnecessary_brace_in_string_interps

class UserModelRepository {
  late final String accessToken;
  late final String refreshToken;
  late final String tokenType;
  late final int expiresIn;

  UserModelRepository(
      {required this.accessToken,
      required this.refreshToken,
      required this.tokenType,
      required this.expiresIn});

  UserModelRepository.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    return data;
  }

  @override
  String toString() {
    return 'UserModelRepository(access_token: ${accessToken}, refresh_token: ${refreshToken}, token_type: ${tokenType}, expires_in: ${expiresIn})';
  }
}
