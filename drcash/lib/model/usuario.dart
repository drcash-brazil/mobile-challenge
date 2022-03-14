class Usuario {
  String email;
  String password;
  String acecessToken;
  String refreshToken;
  num expiresIn;
  String messageError;

  Usuario({
    this.email,
    this.password,
    this.acecessToken,
    this.refreshToken,
    this.expiresIn,
    this.messageError,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      acecessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      expiresIn: json['expires_in'],
    );
  }
}
