import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final String userId;
  final String token;
  final String refreshToken;
  final int expiresIn;
  final bool success;
  final List<String> erros;
  final int errorStatus;

  LoginResponseModel(
    this.userId,
    this.token,
    this.refreshToken,
    this.expiresIn,
    this.success,
    this.erros,
    this.errorStatus,
  );

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
