class SessionResponse {
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int expiresIn;

  SessionResponse(
      {required this.accessToken,
      required this.refreshToken,
      required this.tokenType,
      required this.expiresIn});

  SessionResponse.fromResponse({required Map data})
      : this.accessToken = data["access_token"],
        this.refreshToken = data["refresh_token"],
        this.tokenType = data["token_type"],
        this.expiresIn = data["expires_in"];
}

class CredentialSaved {
  final String email;
  final String password;

  CredentialSaved({
    required this.email,
    required this.password,
  });

  CredentialSaved.fromResponse({required Map data})
      : this.email = data["email"],
        this.password = data["password"];
}
