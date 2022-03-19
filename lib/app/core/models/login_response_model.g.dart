// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      json['userId'] as String,
      json['token'] as String,
      json['refreshToken'] as String,
      json['expiresIn'] as int,
      json['success'] as bool,
      (json['erros'] as List<dynamic>).map((e) => e as String).toList(),
      json['errorStatus'] as int,
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
      'success': instance.success,
      'erros': instance.erros,
      'errorStatus': instance.errorStatus,
    };
